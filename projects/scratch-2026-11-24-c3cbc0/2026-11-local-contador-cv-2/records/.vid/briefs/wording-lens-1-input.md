## Seed

### 2026-11-24 — the owner's brief

Producto: Una sola página donde una persona escribe el resumen de su CV en un cuadro de texto y ve cuántos caracteres lleva, con un límite de 500.
Qué debe hacer:

1. Mostrar el número de caracteres escritos mientras la persona escribe.
2. Cuando el texto supera los 500 caracteres, mostrar un mensaje que lo indique. No definas el texto del mensaje; redáctalo tú.
3. Un botón para borrar todo el texto.

La interfaz está en español.
Fuera de esta versión: guardar el texto, cuentas, enviar o descargar el CV, corrector ortográfico, sugerencias de redacción, otros idiomas, analítica, diseño elaborado (una página limpia y legible basta). Nada se guarda sobre la persona.
Tamaño: es una primera versión. Escribe como máximo 3 requisitos y deja todo lo demás fuera de esta versión.

## Thesis

### Product summary

A single web page, with its interface in Spanish, where a person types or pastes the summary of their CV into one text box and sees, as they write, how many characters it holds against a limit of 500. When the text goes past 500 characters a message says so, without ever blocking the typing; one button clears all the text. Nothing about the person is kept or sent anywhere.

### Primary users

A person writing the summary paragraph of their own CV who needs it to fit within 500 characters before they use it somewhere else.

### MVP focus

- G1: The person always knows how many characters their summary holds, and is told plainly when it is past 500.
- G2: The person can start over with an empty box in one press.
- G3: The summary the person writes stays theirs alone: nothing about them is kept or sent.

### Explicitly not MVP

Saving the text, accounts, sending or downloading the CV, a spell checker, writing suggestions, other languages, analytics, and an elaborate design (a clean, readable page is enough), all as the seed lists them. The first version holds at most three requirements, at the owner's word; everything else waits for a later version.

### Required core flows

- Write or paste a summary and see its character count, and whether it is past 500, at every moment.
- Clear the box in one press to start again.

### Value logic

Wherever a CV summary is limited to 500 characters, the person needs to know before they use it whether it fits, and by how much it does not. The page answers that one question while they write, and asks nothing of them in return: no account, nothing stored.

### Evidence basis

The seed and the five interview answers (A-001 to A-005) are the only sources; they do not conflict. The seed leaves the message's wording to ViD, which is therefore a ViD decision.


## Demand items (id | statement | fail-if)

REQ-001 | Below the text box the page shows how many characters the box holds out of the limit of 500, in the form A-007 states, updated on every change to the text whatever made it. | fail-if: (1) after a change the shown count differs from the characters the person sees in the box, where each space, each line break, each accented letter and each emoji counts as one; (2) after text is pasted, cut, dropped or undone the count does not change until a further key is pressed; (3) the count shows characters remaining instead of characters used; (4) the count stops at 500 while the box holds more

REQ-002 | While the box holds more than 500 characters the message A-006 states is shown below it, and while it holds 500 or fewer no such message is shown; nothing ever blocks or cuts what the person types or pastes. | fail-if: (1) the box holds 501 characters and the over-limit message is not shown; (2) the over-limit message is shown while the box holds 500 characters or fewer; (3) the message is still shown after the text is brought back to 500 characters or fewer; (4) a key press, paste or drop that would take the text past 500 characters is refused, or the text is cut to 500

REQ-003 | One press of the clear button empties the text box at once, with no confirmation, and the count and the over-limit message follow the empty box; undo right after clearing brings the cleared text back. | fail-if: (1) after one press of the clear button the box still holds any character; (2) a confirmation or any other question appears before the box is emptied; (3) after clearing the count shows anything other than zero characters; (4) after clearing the over-limit message is still shown; (5) undo pressed right after clearing does not bring back the text that was cleared

