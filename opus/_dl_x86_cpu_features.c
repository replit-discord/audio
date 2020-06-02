#  define FEATURE_INDEX_MAX 1


enum {
    COMMON_CPUID_INDEX_1 = 0,
    COMMON_CPUID_INDEX_7,
    COMMON_CPUID_INDEX_80000001,        // for AMD
    // Keep the following line at the end.
    COMMON_CPUID_INDEX_MAX
};


struct cpu_features {
    enum cpu_features_kind  {
        arch_kind_unknown = 0,
        arch_kind_intel,
        arch_kind_amd,
        arch_kind_other
    } kind;
    int max_cpuid;
    struct cpuid_registers {
        unsigned int eax;
        unsigned int ebx;
        unsigned int ecx;
        unsigned int edx;
    } cpuid[COMMON_CPUID_INDEX_MAX];
    unsigned int family;
    unsigned int model;
    unsigned int feature[FEATURE_INDEX_MAX];
};


struct cpu_features _dl_x86_cpu_features;
