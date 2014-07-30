tests = [
  {
    protocol: 'weather1'
    pulseLengths: [456, 1990, 3940, 9236]
    pulses: [
      '01020102020201020101010101010102010101010202020101020202010102010101020103'
      '01020102020201020101010101010102010101010202020102010102010102010101020103'
      '01020102020201020101010101010102010101010202020102010101010102010101020103'
    ]
  },
  {
    protocol: 'weather2'
    pulseLengths: [492, 969, 1948, 4004]
    pulses: [
      '01010102020202010201010101010101020202010201020102020202010101010101010103'
      '01010102020202010201010101010101020202010201010202020202010101010101010103'
      '01010102020202010201010101010101020202010201010102020202010101010101010103'
    ]
  },
  {
    protocol: 'switch1'
    pulseLengths: [268, 1282, 2632, 10168]
    pulses: [
      '020001000101000001000100010100010001000100000101000001000101000001000100010100000100010100010000010100000100010100000100010001000103'
      '020001000101000001000100010100010001000100000101000001000101000001000100010100000100010100010000010100000100010100000100010001010003'
      '020001000101000001000100010100010001000100000101000001000101000001000100010100000100010100010000010100000100010001000100010001010003'
    ]
  },
  {
    protocol: 'switch2'
    pulseLengths: [306, 957, 9808]
    pulses: [
      '01010101011001100101010101100110011001100101011002'
    ]    
  },
  { 
    protocol: 'switch4'
    pulseLengths: [ 295, 1180, 11210 ],
    pulses: [
      '01010110010101100110011001100110010101100110011002'
    ]
  }
]

controller = require '../lib/controller.coffee'

for t in tests
  for pulses in t.pulses
    results = controller.parsePulseSquence(t.pulseLengths, pulses)
    # assert results.length is 1
    # addert results[0].protocol is t.protocol
    console.log results 


tests = [
  {
    protocol: 'switch2'
    timings: [
      [ 288, 972, 292, 968, 292, 972, 292, 968, 292, 972, 920, 344, 288, 976, 920, 348, 
        284, 976, 288, 976, 284, 976, 288, 976, 288, 976, 916, 348, 284, 980, 916, 348, 
        284, 976, 920, 348, 284, 976, 920, 348, 284, 980, 280, 980, 284, 980, 916, 348, 
        284, 9808
      ],
      [
        292, 968, 292, 972, 292, 972, 292, 976, 288, 976, 920, 344, 288, 976, 920, 348, 
        284, 976, 288, 976, 288, 976, 284, 980, 284, 976, 920, 348, 284, 976, 916, 352, 
        280, 980, 916, 352, 280, 980, 916, 348, 284, 980, 284, 976, 284, 984, 912, 352, 
        280, 9808
      ],
      [
        292, 976, 288, 972, 292, 972, 292, 920, 288, 976, 920, 344, 288, 980, 916, 344, 
        288, 980, 284, 980, 284, 972, 288, 980, 284, 976, 920, 344, 288, 976, 916, 352, 
        280, 980, 916, 348, 284, 980, 916, 348, 284, 980, 284, 976, 288, 976, 916, 352, 
        280, 9804
      ],
      [
        288, 972, 292, 968, 296, 972, 296, 976, 288, 976, 920, 344, 288, 976, 920, 344, 
        292, 972, 288, 976, 288, 976, 284, 976, 288, 976, 920, 344, 288, 976, 920, 344, 
        284, 980, 916, 348, 284, 980, 916, 348, 284, 980, 284, 976, 288, 980, 912, 352, 
        280, 9808
      ]
    ]
  },
  {
    protocol: 'switch4'
    timings: [
      [
        295, 1180, 295, 1180, 295, 1180, 1180, 295, 295, 1180, 295, 1180, 295, 1180, 1180, 295, 
        295, 1180, 1180, 295, 295, 1180, 1180, 295, 295, 1180, 1180, 295, 295, 1180, 1180, 295, 
        295, 1180, 295, 1180, 295, 1180, 1180, 295, 295, 1180, 1180, 295, 295, 1180, 1180, 295, 
        295, 11210
      ]
    ]
  }
]

for t in tests
  for timings in t.timings
    results = controller.compressTimings(timings)
    console.log results 