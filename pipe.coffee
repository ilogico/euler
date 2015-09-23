"use strict"

deepClone = (obj) ->
  if Array.isArray obj
    deepClone item for item in obj
  else if Object(obj) == obj
    keys = Object.getOwnPropertyNames obj
    properties = {}
    for key in keys
      property = Object.getOwnPropertyDescriptor obj, key
      if property.get or property.set
        property.value = deepClone obj[key]
        delete property.get
        delete property.set
      else
        property.value = deepClone property.value
      properties[key] = property
    Object.create Object.getPrototypeOf(obj), properties
  else
    obj




class EventEmitter
  on: (event, callback) ->
    @events = {} unless @events
    @events[event] = [] unless @events[event]
    @events[event].push callback
  off: (event, callback) ->
    if @events and listeners = @events[event]
        if callback
          @events[event] = listeners.filter((cb) -> cb is not callback)
        else
          delete @events[event]
  emit: (event, args...) ->
    if @events and listeners = @events[event]
      listeners.forEach (cb) -> cb args...




isObject = (val) -> Object(val) is val

makeInit = (init) ->
  if typeof init is 'function'
    init
  else if isObject init
    -> deepClone init
  else
    -> init


makeFunction =
  map: (next, transform) ->
    (val) ->
      next transform(val)


  filter: (next, valid) ->
    valid or=
      if valid == null
        (val) -> val?
      else if valid != valid
        (val) -> val == val
      else
        (val) -> val
    (val) ->
      if valid(val)
        next(val)
      else
        true

  reduce: (next, processor, initial) ->
    if typeof initial is 'function'
      reseter = initial
    else if isObject initial
      reseter = -> deepClone initial
    else reseter = -> initial
    memo = reseter()
    reset = -> memo = reseter()
    @enders.push ->
      m = memo
      reset()
      next m
    @reseters.push reset
    (val) ->
      memo = processor(memo, val)
      true


  fold: (next, processor, initial) ->
    if typeof initial is 'function'
      reseter = initial
    else if isObject(initial)
      reseter = -> deepClone initial
    else
      reseter = -> initial
    memo = reseter()
    reset = ->
      memo = reset
      true
    @reseters.push reset
    @enders.push ->
      reset()
    (value) -> next processor(memo, value)

  do: (next, callback) ->
    (val) ->
      callback(val)
      next(val)


  batch: (next, size) ->
    batch = []
    reset = ->
      batch = []
      true
    @reseters.push reset
    send = ->
      b = batch
      reset()
      next b
    @enders.push ->
      if batch.length
        send()
      else
        true
    (val) ->
      batch.push(val)
      if batch.length >= size
        send()
      else 
        true


  timedBatch: (next, size, time) ->
    batch = []
    timer = null
    reset = ->
      clearTimeout timer
      timer = null
      batch = []
      true
    @reseters.push reset

    send = ->
      if batch.length
        b = batch
        reset()
        next b
      else
        true

    flood = null
    @flooders.push (previousFlooder) -> flood = previousFlooder
    asyncSend = ->
      send() or flood()

    @enders.push -> send()

    if size
      if time < 0
        time = -time
        (val) ->
          clearTimeout timer
          batch.push val
          if batch.length >= size
            send()
          else
            timer = setTimeout send, time
            true
      else
        (val) ->
          batch.push val
          if batch.length >= size
            send()
          else
            timer = setTimeout(send, time) unless timer?
            true
    else
      (val) ->
        clearTimeout timer
        batch.push val
        timer = setTimeout send, time
        true
          


  toArray: (next) ->
    array = []
    reset = -> array = []
    @reseters.push reset

    send = ->
      a = array
      reset()
      next a

    @enders.push  ->
      if array.length
        send()
      else
        true

    (val) ->
      array.push val
      true

  each: (next) ->
    nextEnder = @enders.pop()
    i = 0
    l = 0
    e = null
    @reseters.push ->
      i = 0
      l = 0
      e = null
      true

    send =
      if nextEnder
        ->
          drain = true
          drain = next e[i++] while drain and i < l
          drain and nextEnder()
      else
        ->
          drain = true
          drain = next e[i++] while drain and i < l
          drain

    @drainers.push (previousDrain) ->
      ->
        send() and previousDrain()
      
    (val) ->
      e = val
      i = 0
      l = e.length
      send()

  dissolve: (next, destruct) ->
    i = 0
    l = 0
    e = null
    @reseters.push ->
      i = 0
      l = 0
      e = null
      true

    send = ->
      drain = true
      while drain and i < l
        drain = next e[i++]
      drain

    @drainers.push (previousDrain) ->
      ->
        send() and previousDrain()
      
    (val) ->
      e = destruct val
      i = 0
      l = e.length
      send()


  while: (next, condition) ->
    nextEnder = @enders.pop()
    if nextEnder
      @enders.push ->
        nextEnder()
      (val) ->
        if condition val
          next val
        else
          nextEnder()
    else
      ->
        if condition val
          next val
        else
          true

  forEver: (next) ->
    @enders.push -> true
    next
    
  buffer: (next, size, threshold) ->
    sending = true
    draining = true
    buffer = []
    @reseters.push ->
      sending = true
      draining = true
      buffer = []
    @drainers.push (previousDrain) ->
      ->
        l = buffer.length
        if l
          i = 0
          sending = true
          while sending and i < l
            sending = next buffer[i++]
          buffer = buffer.slice(i)
          l -= i
          draining or= l == 0
          draining and l < threshold and previousDrain()
        else
          previousDrain()
    @flooders.push ->
      ->
        sending = false
    @enders.push ->
      draining = false

    (val) ->
      if sending
        sending = next(val)
        true
      else
        buffer.push val
        buffer.length < size


  soak: (next) ->
    sending = true
    @reseters.push -> sending = true
    @drainders.push ->
      ->
        sending = true
    (val) ->
      sending = next val if sending
      true

  last: (next) ->
    sending = true
    lastValue = null
    buffering = false
    @reseters.push ->
      lastValue = null
      buffering = false
      sending = true
    @drainers.push ->
      ->
        if buffering
          buffering = false
          sending = next(lastValue)
          lastValue = null
          true
        else
          sending = true
    (value) ->
      if sending
        sending = next value
        true
      else
        buffering = true
        lastValue = value
        true      


  throttle: (next, interval) ->
    timer = null
    drainer = null
    @reseters.push ->
      clearTimeout(timer)
      true
    @drainers.push (nextDrainer) ->
      drainer = nextDrainer
    (value) ->
      sent = next(value)
      if sent
        timer = setTimeout(drainer, interval)
      false

  generator: (next, gen) ->
    current = ->
    generate = ->
      sending = true
      while sending and (toSend = current())?
        sending = next(toSend)
      sending
    @drainers.push -> generate
    (val) ->
      current = gen(val)
      generate()


  pipeBuilder: (next, pipe) ->
    signals = {next:next}
    if pipe.reset
      @reseter.push pipe.reset
    if pipe.drain
      @drainers.push (previousDrain) ->
        signals.drain = previousDrain
        ->
          pipe.drain signals
    if pipe.flood
      @flooders.push (previousFlood) ->
        signals.flood = previousFlood
        ->
          pipe.flood signals
    if pipe.end
      signals.end = @enders.pop() or -> true
    if pipe.flush
      @enders.push -> pipe.flush signals
    if pipe.data
      (value) ->
        pipe.data value, signals
    else
      next

  #Strings
  join: (next, joiner) ->
    buf = null
    @reseters.push ->
      buf = null
      true
    @enders.push ->
      r = next buf
      buf = null
      r
    (str) ->
      if buf
        buf = [buf,str].join joiner
      else
        buf = str
      true

  split: (next, splitter) ->
    chunk = ''
    buf = []
    sending = true
    reset = ->
      buf = ''
      buf = []
      sending = true
    @reseters.push reset
    send = ->
      l = buf.length
      if l
        i = 0
        drain = true
        while drain and i < l
          drain = next(buf[i++])
        if drain
          buf = []
          true
        else
          buf = buf.slice i if i
          false
      else
        true
    @drainers.push (previousDrain) ->
      ->
        send() and previousDrain()
    @enders.push ->
      if chunk
        val = chunk
        chunk = ''
        next val
      else
        true
      
    (str) ->
      buf = (chunk + str).split(splitter)
      chunk = buf.pop()
      send()
            

class Pipe
  constructor: () ->
    @pipeline = []
    @enders  = []
    @drainers = []
    @flooders = []
    @reseters = []

    @writable = true
    drain = ->
      @writable = true
    @drain = drain
    flood = -> @writable = false
    @flood = -> flood
    ending = 0
    end = ->
      if @writable
        draining = true
        l = @enders.length
        while draining and ending < l
          draining = @enders[ending++]()
        if draining
          ending = 0
          true
        else
          @flood()
      else
        false
    @end = end

  map: (transform) ->
    @pipeline.push action:'map', args:[transform]
    @
  filter: (valid) ->
    @pipeline.push action:'filter', args:[valid]
    @
  reduce: (processor, memo) ->
    @pipeline.push action:'reduce', args:[processor, memo]
    @
  fold: (processor, memo) ->
    @pipeline.push action:'fold', args:[processor, memo]
    @
  do: (action) ->
    @pipeline.push action:'do', args:[action]
    @
  toArray: ->
    @pipeline.push action:'toArray', args:[]
    @
  batch: (size, timeout) ->
    if timeout?
     args =  action: 'timedBatch', args: [size, timeout]
    else if size
      args = action: 'batch', args: [size]
    else
      args = action: 'toArray', args:[]
    @pipeline.push args
    @
  each: ->
    @pipeline.push action:'each', args:[]
    @
  dissolve: (destructor) ->
    destructor or= (array) ->
      item for item in array
    @pipeline.push action:'dissolve', args:[destructor]
    @
  while: (condition) ->
    @pipeline.push action:'while', args:[condition]
    @
  destruct: ->
    @dissolve (obj) ->
      key:key, value:value for key, value of obj
  while: (condition) ->
    @pipeline.push action:'while', args:[condition]
    @
  forEver: ->
    @pipeline.push action:'forEver'
    @
  buffer: (size = Infinity, threshold = size) ->
    @pipeline.push action:'buffer', args:[size, threshold]
    @
  soak: ->
    @pipeline.push action:'soak', args:[]
    @
  last: ->
    @pipeline.push action:'last', args:[]
    @
  throttle: (interval) ->
    @pipeline.push action:'throttle', args:[interval]
    @
  generator: (fun) ->
    @pipeline.push action:'generator', args:[fun]
    @
  split: (splitter) ->
    @pipeline.push action:'split', args:[splitter]
    @
  join: (joiner) ->
    @pipeline.push action:'join', args:[joiner]
    @
  toReadable: ->
    @readable = false
    value = null
    drain = null
    @drainers.push (previousDrain) ->
      drain = previousDrain
    @read = =>
      res = value
      @readable = false
      drain()
      res
    @compile (val) =>
      @readable = true
      value = val
      false

  compile: (ender) ->
    ender or= -> true
    @compileFunction ender
    @

  compileFunction: (next) ->
    if @pipeline.length
      item = @pipeline.pop()
      args = [next].concat item.args
      @compileFunction makeFunction[item.action].apply(this, args)
    else
      delete @pipeline
      @rawWrite = next
      @send = @write = (data) ->
        @writable and @writable = next(data)
      @enders.reverse()
      drainer = =>
        @drain()
      while @drainers.length
        drainer = @drainers.pop()(drainer)
      flooder = => @flood()
      while @flooders.length
        flooder = @flooders.pop()(flooder)
      @write

  reset: ->
    reset() for reset in @reseters
    true

  write: (data) -> @compile().write(data)
  send: @write


module.exports = Pipe

notUsed =
  exec: ->
    if @input
      if typeof @input.forEach is 'function'
        @input.forEach @compiled
      else if typeof @input.each is 'function'
        @input.each @compiled
      else if @input.length
        if typeof @input.pop is 'function'
          i = 0
          while @input.length
            @compiled @input.pop(), i++
          undefined
        else if '0' of @input
          @compiled val, i for val, i in @input
          undefined
      else if isObject(@item)
        @compiled val, key for key, val of @item
        undefined
