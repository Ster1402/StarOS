# StarOS

## File Structure of StarOS

- bootloader/
  - bootloader.asm         // Code du bootloader en langage d'assemblage
  - bootloader.cpp         // Code du bootloader en C++
  - bootloader.ld          // Script de liaison du bootloader
- kernel/
  - kernel.cpp             // Code principal du noyau du système d'exploitation
  - memory/                // Gestion de la mémoire
    - paging.cpp           // Code de la gestion de la pagination
    - memory.cpp           // Code de la gestion de la mémoire physique et virtuelle
  - interrupts/            // Gestion des interruptions
    - interrupt.cpp        // Code du gestionnaire d'interruptions
    - vectors.cpp          // Code de configuration des vecteurs d'interruption
  - processes/             // Gestion des processus
    - process.cpp          // Code de création et de gestion des processus
- drivers/                 // Pilotes de périphériques
  - screen.cpp             // Code du pilote d'écran
  - keyboard.cpp           // Code du pilote de clavier
- utils/                   // Utilitaires
  - utils.cpp              // Fonctions utilitaires générales
- main.cpp                 // Point d'entrée du programme principal