1. ADDR 
- Bitwidth is 12 bits
- MSB is used to select between sram and registers, and the remaining 11 bits are used for sram address

2. Registers
- cr[16:0] and sr[14:0] are used 
- cr[16]/cr[15]/cr1[14] starts/stops/resets the core. cr[13] resets FSM. The remaining bits are used for core and FSM configurations
- sr[14] is "done" bit. The remaining bits are used to store state of FSM and intermediate results

3. Memory
- A single-port sram with 2048 words
- Word width is 32 bits
