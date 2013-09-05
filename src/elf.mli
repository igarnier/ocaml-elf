type e_class =
  | ELFCLASS32
  | ELFCLASS64

type e_data =
  | ELFDATA2LSB
  | ELFDATA2MSB

type e_osabi =
  | ELFOSABI_SYSV
  | ELFOSABI_HPUX
  | ELFOSABI_NETBSD
  | ELFOSABI_LINUX
  | ELFOSABI_SOLARIS
  | ELFOSABI_AIX
  | ELFOSABI_IRIX
  | ELFOSABI_FREEBSD
  | ELFOSABI_TRU64
  | ELFOSABI_MODESTO
  | ELFOSABI_OPENBSD
  | ELFOSABI_ARM_AEABI
  | ELFOSABI_ARM
  | ELFOSABI_STANDALONE
  | ELFOSABI_EXT of int

type e_type =
  | ET_NONE
  | ET_REL
  | ET_EXEC
  | ET_DYN
  | ET_CORE
  | ET_EXT of int

type e_machine =
  | EM_NONE
  | EM_M32
  | EM_SPARC
  | EM_386
  | EM_68K
  | EM_88K
  | EM_486
  | EM_860
  | EM_MIPS
  | EM_S370
  | EM_MIPS_RS3_LE
  | EM_SPARC64
  | EM_PARISC
  | EM_VPP500
  | EM_SPARC32PLUS
  | EM_960
  | EM_PPC
  | EM_PPC64
  | EM_S390
  | EM_SPU
  | EM_V800
  | EM_FR20
  | EM_RH32
  | EM_RCE
  | EM_ARM
  | EM_ALPHA
  | EM_SH
  | EM_SPARCV9
  | EM_TRICORE
  | EM_ARC
  | EM_H8_300
  | EM_H8_300H
  | EM_H8S
  | EM_H8_500
  | EM_IA_64
  | EM_MIPS_X
  | EM_COLDFIRE
  | EM_68HC12
  | EM_MMA
  | EM_PCP
  | EM_NCPU
  | EM_NDR1
  | EM_STARCORE
  | EM_ME16
  | EM_ST100
  | EM_TINYJ
  | EM_X86_64
  | EM_PDSP
  | EM_FX66
  | EM_ST9PLUS
  | EM_ST7
  | EM_68HC16
  | EM_68HC11
  | EM_68HC08
  | EM_68HC05
  | EM_SVX
  | EM_ST19
  | EM_VAX
  | EM_CRIS
  | EM_JAVELIN
  | EM_FIREPATH
  | EM_ZSP
  | EM_MMIX
  | EM_HUANY
  | EM_PRISM
  | EM_AVR
  | EM_FR30
  | EM_D10V
  | EM_D30V
  | EM_V850
  | EM_M32R
  | EM_MN10300
  | EM_MN10200
  | EM_PJ
  | EM_OPENRISC
  | EM_ARC_A5
  | EM_XTENSA
  | EM_VIDEOCORE
  | EM_TMM_GPP
  | EM_NS32K
  | EM_TPC
  | EM_SNP1K
  | EM_ST200
  | EM_IP2K
  | EM_MAX
  | EM_CR
  | EM_F2MC16
  | EM_MSP430
  | EM_BLACKFIN
  | EM_SE_C33
  | EM_SEP
  | EM_ARCA
  | EM_UNICORE
  | EM_EXT of int

type p_type =
  | PT_NULL
  | PT_LOAD
  | PT_DYNAMIC
  | PT_INTERP
  | PT_NOTE
  | PT_SHLIB
  | PT_PHDR
  | PT_OTHER of Int32.t

type p_flag =
  | PF_X
  | PF_W
  | PF_R
  | PF_EXT of int

type sh_type =
  | SHT_NULL
  | SHT_PROGBITS
  | SHT_SYMTAB
  | SHT_STRTAB
  | SHT_RELA
  | SHT_HASH
  | SHT_DYNAMIC
  | SHT_NOTE
  | SHT_NOBITS
  | SHT_REL
  | SHT_SHLIB
  | SHT_DYNSYM
  | SHT_EXT of Int32.t

type sh_flag =
  | SHF_WRITE
  | SHF_ALLOC
  | SHF_EXECINSTR
  | SHF_EXT of int

type segment = {
  p_type : p_type;
  p_flags : p_flag list;
  p_vaddr : Int64.t;
  p_paddr : Int64.t;
  p_align : Int64.t;
  p_memsz : Int64.t;
  p_data : string;
}

type section = {
  sh_name : string;
  sh_type : sh_type;
  sh_flags : sh_flag list;
  sh_addr : Int64.t;
  sh_size : Int64.t;
  sh_link : Int32.t;
  sh_info : Int32.t;
  sh_addralign : Int64.t;
  sh_entsize : Int64.t;
  sh_data : string;
}

type t = {
  e_class : e_class;
  e_data : e_data;
  e_version : int;
  e_osabi : e_osabi;
  e_abiver : int;
  e_type : e_type;
  e_machine : e_machine;
  e_entry : Int64.t;
  e_sections : section list;
  e_segments : segment list;
}

val parse : string -> t option