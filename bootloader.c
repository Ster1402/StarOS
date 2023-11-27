#include <stdlib.h>
#include <stdio.h>

// Code d'initialisation des composants matériels
void initializeHardware()
{
    // Initialiser l'écran
    // Initialiser le clavier
    // Initialiser d'autres composants matériels nécessaires
}

// Fonction pour transférer le contrôle au noyau du système d'exploitation
void transferControlToKernel()
{
    // Appeler la fonction d'entrée du noyau du système d'exploitation
    //kernelEntry();
}

// 1.1.3.Transfert du contrôle au noyau du système d'exploitation
// Une fois que le bootloader a terminé son initialisation, il doit transférer le contrôle au noyau du système d'exploitation.
// Code du bootloader
void bootloaderMain()
{
    // Charger le bootloader depuis le secteur d'amorçage du disque

    // Initialiser les composants matériels
    initializeHardware();

    // Transférer le contrôle au noyau du système d'exploitation
    transferControlToKernel();
}

// Point d'entrée du bootloader
void bootloaderEntry()
{
    // Appeler la fonction principale du bootloader
    bootloaderMain();
}
