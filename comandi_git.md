# Comandi e procedure Git

Breve raccolta di comandi e procedure per la gestione di repository Git e Git-Hub.com

## Comandi

Impostare la sincronizzazione via SSH con [Git-Hub]([Arawindor · GitHub](https://github.com/Arawindor) utilizzando la SSH public Key:

    git remote set-url origin git@github.com:username/your-repository.git

Creare un ramo (branch):

    git checkout -b nome_branch                 # crea nel branch attuale
    git checkout -b nome_branch branch_padre    # crea nel branch desiderato

Cancellare un Branch:

    git branch -D nome_branch_da_cancellare

Aggiungere file al commit:

    git add nomefile
    git add -A             # aggiungi tutti i file

Effettuare il commit:

    git commit -m "testo del messaggio di commit" nomefile
    git commit -am "testo del messaggio di commit"      # c. di tutti i file

Effettuare il push su github.com:

    git push -u origin branch_desiderata

Effettuare il merge:

    git merge --no-ff branch_di_origine

Impostare un tag ed estenderlo a github.com:

    git --tag X.X.X     # mettere l'etichetta di versione e commento "Rel. Ver. X.X.X"
    git push --tag origin branch_master

## Procedura per il rilascio di una versione

Sincronizzare il ramo develop (da dove origina il release):


    git checkout develop
    git merge --no-ff branch_feature_da_implementare
    git push origin develop


Creare il branch release all'interno del ramo develop e sincronizzarlo:

    git checkout -b release-X.Xdevelop
    git commit -am "assegnato numero di versione X.X.X"
    git push -u origin release-X.X

Portare la release sul ramo master:

    git checkout master
    git merge --no-ff release-X.X.X
    git tag -a X.X.X
    git push --tag origin branch_master

Riallineare il ramo develop:

    git checkout develop
    git merge --no-ff release-X.X
    git push origin develop

## Procedura per risoluzione di problemi (bugfix, hotfix, patch)

Creare il branch di lavoro dal branch_master:

    git checkout main
    git checkout -b hotifx-X.X.X main
    git commit -am "descrizione commit hotfix/bugfix/patch"

Risolvere il problema e caricare il branch_hotfix/patch/bugfix:

    git commit -am "descrizione risoluzione hotfix/bugfix/patch"
    git push origin hotfix-X.X.X

Allineare il ramo Main/Master:

    git checkout branch_master
    git merge --no-ff hotfix-X.X.X
    git tag -a X.X.X        # inserire commento "Rel. Ver. X.X.X"
    git push -u --tags origin branch_master

Riallineare il ramo develop:

    git checkout develop
    git merge --no-ff hotfix-X.X.X
    git push -u origin develop
