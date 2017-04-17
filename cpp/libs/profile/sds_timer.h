#ifndef SDS_TIMER_H_
#define SDS_TIMER_H_

namespace sds_prof {
    class perf_counter
    {
    public:
        uint64_t tot, cnt, calls;
        perf_counter() : tot(0), cnt(0), calls(0) {};
        inline void reset() { tot = cnt = calls = 0; }
        inline void start() { cnt = sds_clock_counter(); calls++; };
        inline void stop() { tot += (sds_clock_counter() - cnt); };
        inline uint64_t avg_cpu_cycles() {return (tot / calls); };
    };
}
#endif 
