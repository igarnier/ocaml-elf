(lang dune 2.6)
(name ocaml-elf)
(version 0.0.1)

(generate_opam_files true)

(source (uri git+https://github.com/igarnier/ocaml-elf.git))
(license MIT)
(authors "Jyun-Yan You, Ilias Garnier")
(maintainers "igarnier@protonmail.com")

(package
 (name ocaml-elf)
 (synopsis "ELF parsing library")
 (depends
  (ppx-inline-test :with-test)
  (bitstring (>= 4.1.0))
  (ppx_bitstring (>= 4.0.1))
 )
)