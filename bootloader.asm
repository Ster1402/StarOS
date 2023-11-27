BITS 16              ; Mode r�el 16 bits

section bootloader
    jmp start         ; Sauter au point d'entr�e

; D�finition de la structure du secteur de d�marrage
struc BootSector
    .signature db 0xAA, 0x55  ; Signature de secteur de d�marrage
    ; Ajoutez d'autres champs si n�cessaire
endstruc

section code
start:
    ; D�finir les registres d'utilisation g�n�rale
    mov ax, 0x07C0        ; Segment de d�marrage
    mov ds, ax
    mov es, ax

    ; Charger le secteur de d�marrage dans la m�moire
    mov bx, 0x0000
    mov ah, 0x02          ; Fonction de lecture du secteur
    mov al, 0x01          ; Nombre de secteurs � lire
    mov ch, 0x00          ; Piste de d�part
    mov cl, 0x02          ; Secteur de d�part
    mov dh, 0x00          ; T�te de d�part
    int 0x13              ; Appel BIOS pour lire le secteur

    ; V�rifier la signature de secteur de d�marrage
    cmp word [BootSector.signature], 0xAA55
    jne error             ; Si la signature n'est pas valide, afficher une erreur et arr�ter

    ; Charger le noyau en m�moire
    mov si, kernel_start  ; Adresse du d�but du noyau
    mov di, 0x1000        ; Adresse de destination en m�moire (par exemple, 0x1000)
    mov cx, kernel_size   ; Taille du noyau en octets
    rep movsb             ; Copier le noyau en m�moire

    ; Jump au noyau
    jmp 0x1000

error:
    ; Afficher un message d'erreur et arr�ter l'ex�cution
    mov si, error_message ; Adresse du message d'erreur
    call print_string

    cli                   ; D�sactiver les interruptions
    hlt                   ; Arr�ter l'ex�cution

print_string:
    ; Afficher une cha�ne de caract�res termin�e par un z�ro
    lodsb                 ; Charger le premier caract�re de SI dans AL
    test al, al           ; V�rifier si AL est z�ro (fin de la cha�ne)
    jz done               ; Si oui, terminer
    mov ah, 0x0E          ; Fonction d'affichage TTY
    int 0x10              ; Appel BIOS pour afficher le caract�re
    jmp print_string      ; Afficher le caract�re suivant

done:
    ret

section kernel_start
    ; D�but du noyau
    ; Mettez votre code du noyau ici

section kernel_size equ $-kernel_start
section error_message db "Erreur de chargement du noyau", 0

times 510-($-$$) db 0   ; Remplir le reste du secteur de d�marrage avec des z�ros
dw 0xAA55              ; Fin de secteur de d�marrage