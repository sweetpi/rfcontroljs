lastStates = {}
module.exports = (helper) ->
  pulsesToBinaryMapping = {
    '10': '0' #binary 0
    '01': '1' #binary 1
    '02': ''    #footer
  }
  binaryToPulse = {
    '0': '10'
    '1': '01'
  }
  return protocolInfo = {
    name: 'contact2'
    type: 'pir'
    values:
      id:
        type: "number"
      contact:
        type: "boolean"
    brands: ["No brand"]
    pulseLengths: [295, 886, 9626]
    pulseCount: 50
    decodePulses: (pulses) ->
      binary = helper.map(pulses, pulsesToBinaryMapping)
      id = helper.binaryToNumber(binary, 0, 19)
      time = new Date().getTime()
      if lastStates[id]?
        if time - lastStates[id].time > 1000 # the contact sends multiple messages
          # switch state
          contact = not lastStates[id].state
          lastStates[id].state = contact
        else
          # keep state
          contact = lastStates[id].state
      else
        # initial state
        lastStates[id] = {time: time, state: true}
        contact = true
      return result = {
        id: id
        contact: contact
      }
  }
