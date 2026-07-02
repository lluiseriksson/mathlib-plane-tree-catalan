# Kit Mathlib (idea 2, playbook de la 1) + paper

## Contenido
- `Mathlib/Combinatorics/Enumerative/PlaneTree.lean` — **PR-1 listo**:
  compilado en verde contra el pin (= toolchain master actual), oráculo
  limpio, test numérico OK (`pr1-compile-oracle.log`).
- `PR1_DESCRIPTION.md` — título + descripción del PR listos para pegar +
  checklist del proceso Mathlib (acceso push vía #new members, `mk_all`, etc.).
- `ZULIP_POST.md` — el post en inglés para #maths: presenta la proposición
  abierta ya cerrada en Lean y propone la escalera de PRs — la pregunta de
  diseño del PR-4a incluida (es la que genera la conversación con
  mantenedores que buscaba la idea 2).
- `MATHLIB_PR_LADDER.md` — la escalera completa PR-1…PR-4b con fuentes en
  el repo y notas de proceso.
- `paper/paper.pdf` + `paper/paper.tex` — el paper, incluido junto como
  pediste (idéntico al del kit anterior).

## Orden sugerido
1. Publicar `ZULIP_POST.md` en el Zulip de Lean (#maths).
2. Pedir acceso push en #new members (mismo hilo o aparte).
3. Rama `LE/plane-tree-catalan` sobre master + copiar el archivo +
   `lake exe mk_all` + abrir PR-1 con `PR1_DESCRIPTION.md`.
4. Con el feedback del hilo, preparamos PR-2 (yo te genero el archivo
   genérico Mathlib-style del kit `childrenOf` cuando quieras).
