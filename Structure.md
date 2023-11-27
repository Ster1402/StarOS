# StarOS

## File Structure of StarOS

- bootloader/
  - bootloader.asm         // Code du bootloader en langage d'assemblage
  - bootloader.cpp         // Code du bootloader en C++
  - bootloader.ld          // Script de liaison du bootloader
- kernel/
  - kernel.cpp             // Code principal du noyau du syst�me d'exploitation
  - memory/                // Gestion de la m�moire
    - paging.cpp           // Code de la gestion de la pagination
    - memory.cpp           // Code de la gestion de la m�moire physique et virtuelle
  - interrupts/            // Gestion des interruptions
    - interrupt.cpp        // Code du gestionnaire d'interruptions
    - vectors.cpp          // Code de configuration des vecteurs d'interruption
  - processes/             // Gestion des processus
    - process.cpp          // Code de cr�ation et de gestion des processus
- drivers/                 // Pilotes de p�riph�riques
  - screen.cpp             // Code du pilote d'�cran
  - keyboard.cpp           // Code du pilote de clavier
- utils/                   // Utilitaires
  - utils.cpp              // Fonctions utilitaires g�n�rales
- main.cpp                 // Point d'entr�e du programme principal