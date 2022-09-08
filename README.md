# GestionAutoFichier

GestionAutoFichier est un script bash permettant de créer des dossiers de réunion avec une nomenclature particulière (ex : aaaa_mm_jj) contenant un fichier d'ordre du jour et un fichier de compte rendu à compléter.

## Utiliser le script

#### Créer un dossier pour le jour même

```bash
./fichierAuto.sh
```

#### Créer un dossier pour un jour donnée

```bash
./fichierAuto.sh jour mois annee
```

#### Supprimer le dossier créer pour le jour même

```bash
./fichierAuto.sh -d
```

OU

```bash
./fichierAuto.sh --delete
```

#### Faire appel a l'aide

```bash
./fichierAuto.sh -h
```

OU

```bash
./fichierAuto.sh --help
```

