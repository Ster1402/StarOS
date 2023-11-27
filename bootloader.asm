BITS 16              ; Mode réel 16 bits

section bootloader
    jmp start         ; Sauter au point d'entrée

; Définition de la structure du secteur de démarrage
struc BootSector
    .signature db 0xAA, 0x55  ; Signature de secteur de démarrage
    ; Ajoutez d'autres champs si nécessaire
endstruc

section code
start:
    ; Définir les registres d'utilisation générale
    mov ax, 0x07C0        ; Segment de démarrage
    mov ds, ax
    mov es, ax

    ; Charger le secteur de démarrage dans la mémoire
    mov bx, 0x0000
    mov ah, 0x02          ; Fonction de lecture du secteur
    mov al, 0x01          ; Nombre de secteurs à lire
    mov ch, 0x00          ; Piste de départ
    mov cl, 0x02          ; Secteur de départ
    mov dh, 0x00          ; Tête de départ
    int 0x13              ; Appel BIOS pour lire le secteur

    ; Vérifier la signature de secteur de démarrage
    cmp word [BootSector.signature], 0xAA55
    jne error             ; Si la signature n'est pas valide, afficher une erreur et arrêter

    ; Charger le noyau en mémoire
    mov si, kernel_start  ; Adresse du début du noyau
    mov di, 0x1000        ; Adresse de destination en mémoire (par exemple, 0x1000)
    mov cx, kernel_size   ; Taille du noyau en octets
    rep movsb             ; Copier le noyau en mémoire

    ; Jump au noyau
    jmp 0x1000

error:
    ; Afficher un message d'erreur et arrêter l'exécution
    mov si, error_message ; Adresse du message d'erreur
    call print_string

    cli                   ; Désactiver les interruptions
    hlt                   ; Arrêter l'exécution

print_string:
    ; Afficher une chaîne de caractères terminée par un zéro
    lodsb                 ; Charger le premier caractère de SI dans AL
    test al, al           ; Vérifier si AL est zéro (fin de la chaîne)
    jz done               ; Si oui, terminer
    mov ah, 0x0E          ; Fonction d'affichage TTY
    int 0x10              ; Appel BIOS pour afficher le caractère
    jmp print_string      ; Afficher le caractère suivant

done:
    ret

section kernel_start
    ; Début du noyau
    ; Mettez votre code du noyau ici

section kernel_size equ $-kernel_start
section error_message db "Erreur de chargement du noyau", 0

times 510-($-$$) db 0   ; Remplir le reste du secteur de démarrage avec des zéros
dw 0xAA55              ; Fin de secteur de démarrage