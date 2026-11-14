#!/bin/bash
# guessinggame.sh
# Jeu : deviner le nombre de fichiers dans le repertoire actuel.
# Fonction qui compte les fichiers (pas les dossiers) du repertoire actuel
count_files() {
    find . -maxdepth 1 -type f | wc -l | tr -d ' '
}
correct=$(count_files)
guess=-1
echo "Bienvenue dans le jeu de devinette !"
echo "Combien de fichiers y a-t-il dans le repertoire actuel ?"
# La boucle continue tant que la reponse n'est pas correcte
while [[ $guess -ne $correct ]]
do
    read -p "Entrez votre estimation : " guess
    # Verifie que l'entree est bien un nombre entier
    if ! [[ $guess =~ ^[0-9]+$ ]]
    then
        echo "Veuillez entrer un nombre entier valide."
        guess=-1
    elif [[ $guess -lt $correct ]]
    then
        echo "Trop bas ! Essayez encore."
    elif [[ $guess -gt $correct ]]
    then
        echo "Trop haut ! Essayez encore."
    fi
done
echo "Felicitations ! Il y a bien $correct fichiers dans ce repertoire."
