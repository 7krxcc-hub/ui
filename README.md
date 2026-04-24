# Documentation — Librairie UI Roblox (`ui.lua`)

> Librairie d'interface graphique pour scripts Roblox (exécuteurs type Synapse, KRNL, etc.).  
> Produit une fenêtre flottante, draggable, avec sidebar à onglets, groupes de composants,
> sauvegarde de configs JSON, et notifications animées.

---

## Table des matières

1. [Démarrage rapide](#1-démarrage-rapide)
2. [Window — La fenêtre principale](#2-window--la-fenêtre-principale)
3. [Section & Tab — Navigation](#3-section--tab--navigation)
4. [GroupBox — Conteneur de widgets](#4-groupbox--conteneur-de-widgets)
5. [Widgets](#5-widgets)
   - [Toggle](#51-toggle)
   - [Slider](#52-slider)
   - [Button](#53-button)
   - [Input](#54-input)
   - [Dropdown](#55-dropdown)
   - [DynamicDropdown](#56-dynamicdropdown)
   - [ColorPicker](#57-colorpicker)
   - [Keybind](#58-keybind)
   - [Label](#59-label)
   - [Separator](#510-separator)
   - [TextSeparator](#511-textseparator)
6. [Notifications](#6-notifications)
7. [Système de config (Save / Load)](#7-système-de-config-save--load)
8. [Icônes disponibles](#8-icônes-disponibles)
9. [Thèmes de couleur](#9-thèmes-de-couleur)
10. [Référence complète des paramètres](#10-référence-complète-des-paramètres)

---

## 1. Démarrage rapide

```lua
-- 1. Charger la librairie
local UI = loadstring(game:HttpGet("URL_VERS_ui.lua"))()

-- 2. Créer la fenêtre
local Window = UI:New({
    Name          = "Mon Script",
    Subtitle      = "v1.0",
    Icon          = "lucide-rocket",   -- nom d'une icône Lucide OU rbxassetid
    ToggleKey     = "RightControl",    -- touche pour afficher/masquer
    ConfigFolder  = "MonScript",       -- dossier de sauvegarde des configs
    Size          = "720x460",         -- largeur x hauteur (optionnel)
    Transparency  = false,             -- fond légèrement transparent
})

-- 3. Ajouter une section dans la sidebar
local Section = Window:AddSection("Combat")

-- 4. Créer un onglet dans cette section
local Tab = Section:AddTab({ Name = "Aimbot", icon = "lucide-crosshair" })

-- 5. Ajouter un groupe dans l'onglet
local Box = Tab:AddGroupBox("Paramètres")

-- 6. Ajouter des widgets dans le groupe
local toggle = Box:AddToggle({
    Name     = "Activer l'aimbot",
    Default  = false,
    Callback = function(value)
        print("Aimbot :", value)
    end
})

local slider = Box:AddSlider({
    Name     = "FOV",
    Min      = 10,
    Max      = 200,
    Default  = 90,
    Suffix   = " px",
    Callback = function(value)
        print("FOV :", value)
    end
})
```

---

## 2. Window — La fenêtre principale

### `UI:New(cfg)` → `Window`

Crée et affiche la fenêtre. Lance automatiquement l'écran de chargement animé.

| Paramètre      | Type    | Défaut             | Description                                              |
|----------------|---------|--------------------|----------------------------------------------------------|
| `Name`         | string  | `"Script"`         | Titre affiché en haut et sur l'écran de chargement       |
| `Subtitle`     | string  | `""`               | Sous-titre (version, auteur…)                            |
| `Icon`         | string  | —                  | Icône Lucide (`"lucide-rocket"`) ou `rbxassetid://...`   |
| `ToggleKey`    | string  | —                  | Touche clavier pour afficher/masquer (ex : `"RightControl"`) |
| `ConfigFolder` | string  | `"MyScript_Configs"` | Nom du dossier de sauvegarde des configs               |
| `Size`         | string  | `"720x460"`        | Dimensions `"LARGEURxHAUTEUR"`                          |
| `Transparency` | boolean | `false`            | Active le fond semi-transparent                          |

### Méthodes de Window

```lua
Window:AddSection(name)    -- Crée une section dans la sidebar → Section
Window:Toggle()            -- Affiche ou masque la fenêtre
Window:SetToggleKey(key)   -- Change la touche toggle (string ou Enum.KeyCode)
Window:Destroy()           -- Détruit complètement la GUI
```

**Exemple complet :**

```lua
local Window = UI:New({
    Name         = "ESP Pro",
    Subtitle     = "by user",
    Icon         = "lucide-eye",
    ToggleKey    = "F4",
    ConfigFolder = "ESPPro_Configs",
})

-- Masquer/afficher via script
Window:Toggle()

-- Changer la touche toggle dynamiquement
Window:SetToggleKey("Insert")

-- Supprimer l'interface
Window:Destroy()
```

---

## 3. Section & Tab — Navigation

### `Window:AddSection(name)` → `Section`

Crée une section (catégorie) dans la sidebar avec un label en majuscules.

```lua
local MainSection     = Window:AddSection("Main")
local CombatSection   = Window:AddSection("Combat")
local VisualsSection  = Window:AddSection("Visuals")
```

### `Section:AddTab(cfg)` → `Tab`

Ajoute un onglet cliquable dans la sidebar, sous la section parente.

| Paramètre | Type   | Description                            |
|-----------|--------|----------------------------------------|
| `Name`    | string | Texte affiché dans la sidebar          |
| `icon`    | string | Icône Lucide ou assetid (optionnel)    |

```lua
local TabMain    = MainSection:AddTab({ Name = "Général",  icon = "lucide-home" })
local TabAimbot  = CombatSection:AddTab({ Name = "Aimbot", icon = "lucide-crosshair" })
local TabESP     = VisualsSection:AddTab({ Name = "ESP",   icon = "lucide-eye" })
```

### `Tab:AddGroupBox(cfg)` → `GroupBox`

Crée un groupe de widgets à l'intérieur d'un onglet.  
`cfg` peut être une **string** (juste le nom) ou une **table**.

| Paramètre | Type    | Défaut     | Description                                                    |
|-----------|---------|------------|----------------------------------------------------------------|
| `Name`    | string  | `""`       | Titre du groupe (affiché en haut à gauche)                     |
| `type`    | number  | `1`        | `1` = pleine largeur, `2` = demi-largeur (deux colonnes)       |
| `side`    | string  | `"left"`   | `"left"` ou `"right"` (seulement pour `type=2`)                |

```lua
-- Groupe pleine largeur
local Box = TabMain:AddGroupBox("Paramètres")

-- Deux groupes côte à côte (type=2)
local LeftBox  = TabMain:AddGroupBox({ Name = "Gauche",  type = 2, side = "left"  })
local RightBox = TabMain:AddGroupBox({ Name = "Droite",  type = 2, side = "right" })
```

---

## 4. GroupBox — Conteneur de widgets

Un `GroupBox` est le conteneur dans lequel on place tous les widgets. Il expose les méthodes `Add*` décrites ci-dessous.

La barre d'accentuation colorée à gauche et le titre en gris le rendent visuellement distinct.

---

## 5. Widgets

### 5.1 Toggle

Interrupteur ON/OFF avec animation de glissement.  
Supporte optionnellement un keybind intégré.

```lua
local toggle = Box:AddToggle({
    Name       = "Silent Aim",
    Default    = false,          -- état initial
    keybind    = true,           -- affiche un bouton de raccourci clavier
    DefaultKey = "X",            -- touche par défaut (string ou Enum.KeyCode)
    Callback   = function(value)
        print("Silent Aim :", value)  -- true ou false
    end
})

-- API
toggle:Get()              -- → boolean
toggle:Set(true)          -- change l'état
toggle:GetKey()           -- → Enum.KeyCode ou nil  (si keybind=true)
toggle:SetKey("G")        -- change le keybind      (si keybind=true)
```

**Exemple avec keybind :**

```lua
local myToggle = Box:AddToggle({
    Name       = "ESP",
    Default    = true,
    keybind    = true,
    DefaultKey = "Z",
    Callback   = function(v)
        ESP.enabled = v
    end
})
```

---

### 5.2 Slider

Curseur numérique glissable. La valeur est également éditable directement via textbox.

```lua
local slider = Box:AddSlider({
    Name     = "Walk Speed",
    Min      = 16,
    Max      = 200,
    Default  = 16,
    Suffix   = " u/s",     -- suffixe affiché après la valeur
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

-- API
slider:Get()       -- → number
slider:Set(50)     -- change la valeur (clampée entre Min et Max)
```

**Exemple :**

```lua
local fovSlider = Box:AddSlider({
    Name     = "FOV",
    Min      = 10,
    Max      = 360,
    Default  = 90,
    Suffix   = "°",
    Callback = function(v)
        Camera.FieldOfView = v
    end
})
```

---

### 5.3 Button

Bouton cliquable avec animation de flash.

```lua
local btn = Box:AddButton({
    Name     = "Téléporter au spawn",
    Callback = function()
        -- action au clic
        print("Bouton cliqué !")
    end
})
```

**Avec notification automatique :**

```lua
local btn = Box:AddButton({
    Name     = "Sauvegarder",
    Callback = function()
        -- logique...
    end
})

btn:AddNotify({
    Title       = "Sauvegardé",
    Description = "Données enregistrées avec succès.",
    Duration    = 4,
})
```

---

### 5.4 Input

Champ de texte (ou numérique).

```lua
local input = Box:AddInput({
    Name        = "Nom du joueur",
    Default     = "",
    Placeholder = "Entrez un nom...",
    Numeric     = false,   -- true = accepte uniquement des nombres
    Callback    = function(value)
        print("Valeur saisie :", value)
    end
})

-- API
input:Get()         -- → string (ou number si Numeric=true)
input:Set("texte")  -- change la valeur affichée
```

**Exemple champ numérique :**

```lua
local portInput = Box:AddInput({
    Name        = "Port",
    Default     = "8080",
    Numeric     = true,
    Callback    = function(v)
        print("Port :", v)
    end
})
```

---

### 5.5 Dropdown

Menu déroulant avec sélection simple ou multiple.

```lua
-- Sélection simple
local dd = Box:AddDropdown({
    Name        = "Arme",
    Options     = { "AK-47", "M4A4", "AWP" },
    Default     = "AK-47",
    Placeholder = "Choisir une arme...",
    Callback    = function(value)
        print("Arme sélectionnée :", value)
    end
})

-- Sélection multiple
local ddMulti = Box:AddDropdown({
    Name        = "Effets actifs",
    Options     = { "Blur", "Bloom", "DOF" },
    MultiSelect = true,
    Default     = { "Bloom" },
    Callback    = function(list)
        -- list est une table des éléments sélectionnés
        for _, v in ipairs(list) do print(v) end
    end
})

-- API
dd:Get()           -- → string (simple) ou table (MultiSelect)
dd:Set("AWP")      -- sélectionne "AWP"
dd:Set({"Blur", "DOF"})  -- pour MultiSelect
```

**Avec couleurs par option :**

```lua
local dd = Box:AddDropdown({
    Name    = "Équipe",
    Options = { "Rouge", "Bleu", "Vert" },
    Colors  = {
        Rouge = Color3.fromRGB(220, 50, 50),
        Bleu  = Color3.fromRGB(50, 100, 220),
        Vert  = Color3.fromRGB(50, 180, 80),
    },
    Callback = function(v) print(v) end
})
```

---

### 5.6 DynamicDropdown

Comme le Dropdown, mais la liste d'options peut être mise à jour dynamiquement après création.

```lua
local dynDd = Box:AddDynamicDropdown({
    Name        = "Config",
    Options     = { "Config1", "Config2" },
    Default     = "",
    Placeholder = "Sélectionner...",
    Callback    = function(value)
        print("Config choisie :", value)
    end
})

-- API
dynDd:Get()                        -- → string
dynDd:Set("Config1")               -- sélectionne une option
dynDd:SetOptions({ "A", "B", "C" }) -- remplace toute la liste
```

---

### 5.7 ColorPicker

Sélecteur de couleur HSV avec deux onglets : sélecteur visuel et éditeur de valeurs (RGB/HSV/Hex).  
Supporte optionnellement un canal Alpha (transparence).

```lua
-- Sans alpha
local cp = Box:AddColorPicker({
    Name     = "Couleur ESP",
    Default  = Color3.fromRGB(255, 0, 100),
    Callback = function(color)
        print("Couleur :", color)
    end
})

-- Avec alpha
local cpAlpha = Box:AddColorPicker({
    Name                 = "Couleur de fond",
    Default              = Color3.fromRGB(0, 120, 255),
    DefaultTransparency  = 0.3,  -- 0 = opaque, 1 = invisible
    Transparency         = true,
    Callback             = function(color, alpha)
        print("Couleur :", color, "Alpha :", alpha)
    end
})

-- API
cp:Get()              -- → Color3
cpAlpha:GetAlpha()    -- → number (0-1), seulement si Transparency=true
cp:Set(Color3.fromRGB(255, 255, 0))
cpAlpha:Set(Color3.fromRGB(0, 0, 255), 0.5)  -- couleur + alpha
```

---

### 5.8 Keybind

Champ de raccourci clavier autonome (indépendant du keybind intégré dans Toggle).

```lua
local kb = Box:AddKeybind({
    Name     = "Activer ESP",
    Default  = "F",    -- touche par défaut
    Callback = function(key)
        -- key est un Enum.KeyCode ou nil (si effacé)
        if key then print("Touche liée :", key.Name) end
    end
})

-- API
kb:Get()       -- → Enum.KeyCode ou nil
kb:Set("G")    -- change la touche (clic droit ou bouton × pour effacer)
```

> **Note :** Un clic droit sur le bouton efface le keybind. La librairie protège contre les doublons : assigner une touche déjà utilisée affiche une notification d'erreur.

---

### 5.9 Label

Texte statique (ou dynamique via `:Set()`).

```lua
local lbl = Box:AddLabel({ Name = "Version : 1.0.3" })

-- Mise à jour dynamique
lbl:Set("Version : 1.0.4")
lbl:Get()  -- → string
```

---

### 5.10 Separator

Séparateur visuel horizontal avec un point accent central.

```lua
Box:AddSeparator()
```

---

### 5.11 TextSeparator

Séparateur avec un label texte centré (utile pour créer des sous-sections).

```lua
Box:AddTextSeparator({ Name = "Paramètres avancés" })
```

---

## 6. Notifications

Affiche une notification animée en bas à droite de l'écran.  
La barre de progression se réduit depuis les deux côtés jusqu'à la fermeture.

### Via `AddNotify` sur un widget

Tous les widgets supportent `AddNotify`. La notification se déclenche à chaque interaction utilisateur.

```lua
local toggle = Box:AddToggle({
    Name     = "Mode Godmode",
    Default  = false,
    Callback = function(v) end
})

toggle:AddNotify({
    Title       = "Godmode",
    Description = "Mode activé/désactivé.",
    Duration    = 3,   -- durée en secondes (ou string "3")
})
```

### Via la fonction globale `Notify` (interne)

> La fonction `Notify` est interne à la librairie. Elle est appelée automatiquement par le système de config et les erreurs de keybind. Vous pouvez la réutiliser via les mécanismes `AddNotify`.

---

## 7. Système de config (Save / Load)

La librairie inclut un système complet de sauvegarde/chargement dans l'onglet **Settings** (icône engrenage).

### Fonctionnement automatique

Tous les widgets créés avec un `Name` non vide sont **automatiquement enregistrés** avec une clé basée sur leur type et leur nom :

| Méthode            | Préfixe de clé   |
|--------------------|-----------------|
| `AddToggle`        | `toggle_`       |
| `AddSlider`        | `slider_`       |
| `AddInput`         | `input_`        |
| `AddDropdown`      | `dropdown_`     |
| `AddColorPicker`   | `color_`        |
| `AddKeybind`       | `keybind_`      |

### Onglet Settings

L'onglet Settings est accessible via le bouton ⚙ en bas de la sidebar. Il propose :

- **Save Config** : saisir un nom et sauvegarder l'état de tous les widgets dans un fichier JSON.
- **Load Config** : charger une config sauvegardée.
- **Delete Config** : supprimer une config (confirmation requise).
- **Autoload** : définir une config qui se charge automatiquement à chaque exécution du script.
- **Thème** : changer la couleur d'accentuation de l'interface.

### Dossier de sauvegarde

Les configs sont stockées dans :
```
<ConfigFolder>/<nom_config>.json
```
Le dossier par défaut est `MyScript_Configs`. Il est modifiable via `Window:New({ ConfigFolder = "MonDossier" })`.

---

## 8. Icônes disponibles

La librairie intègre **plusieurs centaines d'icônes Lucide**. Utilisez le nom sous forme de string dans tous les champs `icon`, `Icon`, `Image`.

**Quelques exemples populaires :**

```
lucide-home          lucide-settings       lucide-user
lucide-eye           lucide-eye-off        lucide-crosshair
lucide-target        lucide-rocket         lucide-shield
lucide-sword         lucide-bolt           lucide-star
lucide-heart         lucide-skull          lucide-ghost
lucide-zap           lucide-wifi           lucide-search
lucide-trash         lucide-edit           lucide-download
lucide-upload        lucide-check          lucide-x
lucide-plus          lucide-minus          lucide-info
lucide-alert-triangle lucide-lock          lucide-unlock
lucide-key           lucide-map-pin        lucide-globe
lucide-code          lucide-terminal       lucide-cpu
lucide-database      lucide-server         lucide-layers
lucide-sliders       lucide-palette        lucide-gamepad
lucide-music         lucide-camera         lucide-mic
```

Vous pouvez aussi utiliser directement un asset Roblox :
```lua
icon = "rbxassetid://12345678"
-- ou
icon = 12345678  -- number
```

---

## 9. Thèmes de couleur

L'onglet Settings propose 6 thèmes d'accentuation (couleur principale de l'interface) :

| Nom      | Couleur         |
|----------|-----------------|
| `Rose`   | `#ff2d79` (défaut) |
| `Or`     | `#c58f1d`       |
| `Rouge`  | `#d7051c`       |
| `Bleu`   | `#001baf`       |
| `Forêt`  | `#00a002`       |
| `Violet` | `#3b0089`       |

---

## 10. Référence complète des paramètres

### Window

```lua
UI:New({
    Name          = "string",      -- Titre
    Subtitle      = "string",      -- Sous-titre
    Icon          = "string",      -- Icône (lucide-... ou rbxassetid://...)
    ToggleKey     = "string",      -- Touche toggle (nom Enum.KeyCode)
    ConfigFolder  = "string",      -- Dossier config
    Size          = "720x460",     -- Dimensions
    Transparency  = false,         -- Fond transparent
})
```

### Tab

```lua
Section:AddTab({
    Name  = "string",  -- Texte de l'onglet
    icon  = "string",  -- Icône (optionnel)
})
```

### GroupBox

```lua
Tab:AddGroupBox({
    Name  = "string",   -- Titre du groupe
    type  = 1,          -- 1 = pleine largeur, 2 = demi-largeur
    side  = "left",     -- "left" ou "right" (type=2 seulement)
})
-- ou simplement
Tab:AddGroupBox("Nom du groupe")
```

### Toggle

```lua
Box:AddToggle({
    Name       = "string",    -- Libellé
    Default    = false,       -- État initial
    keybind    = false,       -- true = affiche un raccourci
    DefaultKey = "string",    -- Touche par défaut si keybind=true
    Callback   = function(bool) end,
})
```

### Slider

```lua
Box:AddSlider({
    Name     = "string",
    Min      = 0,
    Max      = 100,
    Default  = 0,
    Suffix   = "string",   -- texte après la valeur (ex: " px", "%")
    Callback = function(number) end,
})
```

### Button

```lua
Box:AddButton({
    Name     = "string",
    Callback = function() end,
})
```

### Input

```lua
Box:AddInput({
    Name        = "string",
    Default     = "string",
    Placeholder = "string",
    Numeric     = false,    -- true = chiffres seulement
    Callback    = function(value) end,
})
```

### Dropdown

```lua
Box:AddDropdown({
    Name        = "string",
    Options     = { "A", "B", "C" },
    Default     = "A",          -- string (simple) ou table (MultiSelect)
    Placeholder = "string",
    MultiSelect = false,
    Colors      = { A = Color3, B = Color3 },  -- optionnel
    Callback    = function(value_or_list) end,
})
```

### DynamicDropdown

```lua
Box:AddDynamicDropdown({
    Name        = "string",
    Options     = { "A", "B" },
    Default     = "string",
    Placeholder = "string",
    Callback    = function(value) end,
})
```

### ColorPicker

```lua
Box:AddColorPicker({
    Name                = "string",
    Default             = Color3.fromRGB(r, g, b),
    Transparency        = false,          -- true = active le canal alpha
    DefaultTransparency = 0,              -- 0-1 (0 = opaque)
    Callback            = function(color3, alpha) end,
    -- alpha est nil si Transparency=false
})
```

### Keybind

```lua
Box:AddKeybind({
    Name     = "string",
    Default  = "string",   -- nom Enum.KeyCode (ex: "F", "Delete")
    Callback = function(KeyCode_or_nil) end,
})
```

### Label

```lua
Box:AddLabel({ Name = "string" })
```

### Separator

```lua
Box:AddSeparator()
```

### TextSeparator

```lua
Box:AddTextSeparator({ Name = "string" })
```

### AddNotify (sur tout widget)

```lua
widget:AddNotify({
    Title       = "string",
    Description = "string",
    Duration    = 3,         -- secondes (number ou string)
})
```

---

## Exemple complet

```lua
local UI = loadstring(game:HttpGet("URL_ui.lua"))()

-- Fenêtre
local Window = UI:New({
    Name         = "My Cheat",
    Subtitle     = "v2.0",
    Icon         = "lucide-sword",
    ToggleKey    = "RightControl",
    ConfigFolder = "MyCheat_Configs",
})

-- ─── Section Combat ────────────────────────────────────────────────
local sCombat = Window:AddSection("Combat")
local tAimbot = sCombat:AddTab({ Name = "Aimbot", icon = "lucide-crosshair" })

local boxAim = tAimbot:AddGroupBox("Paramètres")

local toggleAim = boxAim:AddToggle({
    Name     = "Activer",
    Default  = false,
    keybind  = true,
    DefaultKey = "C",
    Callback = function(v)
        -- activer/désactiver aimbot
    end
})
toggleAim:AddNotify({ Title = "Aimbot", Description = "État changé.", Duration = 2 })

boxAim:AddSlider({
    Name     = "Smoothness",
    Min      = 1,
    Max      = 100,
    Default  = 20,
    Suffix   = "%",
    Callback = function(v) end
})

boxAim:AddDropdown({
    Name     = "Partie du corps",
    Options  = { "Tête", "Torse", "Membres" },
    Default  = "Tête",
    Callback = function(v) end
})

boxAim:AddSeparator()

boxAim:AddButton({
    Name     = "Réinitialiser",
    Callback = function()
        toggleAim:Set(false)
    end
})

-- ─── Section Visuals ───────────────────────────────────────────────
local sVisuals = Window:AddSection("Visuals")
local tESP     = sVisuals:AddTab({ Name = "ESP", icon = "lucide-eye" })

-- Deux colonnes
local boxESPLeft  = tESP:AddGroupBox({ Name = "Joueurs",  type = 2, side = "left"  })
local boxESPRight = tESP:AddGroupBox({ Name = "Options",  type = 2, side = "right" })

boxESPLeft:AddToggle({ Name = "Boxes",      Default = false, Callback = function(v) end })
boxESPLeft:AddToggle({ Name = "Noms",       Default = true,  Callback = function(v) end })
boxESPLeft:AddToggle({ Name = "Santé",      Default = true,  Callback = function(v) end })

boxESPRight:AddColorPicker({
    Name     = "Couleur ennemis",
    Default  = Color3.fromRGB(255, 50, 50),
    Callback = function(c) end
})

boxESPRight:AddSlider({
    Name     = "Épaisseur",
    Min      = 1,
    Max      = 5,
    Default  = 1,
    Suffix   = " px",
    Callback = function(v) end
})

-- ─── Section Misc ──────────────────────────────────────────────────
local sMisc = Window:AddSection("Misc")
local tMisc = sMisc:AddTab({ Name = "Général", icon = "lucide-settings" })

local boxMisc = tMisc:AddGroupBox("Mouvement")

boxMisc:AddSlider({ Name = "WalkSpeed",    Min = 16,  Max = 500, Default = 16,  Suffix = "", Callback = function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end })

boxMisc:AddSlider({ Name = "JumpPower",    Min = 50,  Max = 500, Default = 50,  Suffix = "", Callback = function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end })

boxMisc:AddTextSeparator({ Name = "Infos" })
boxMisc:AddLabel({ Name = "Script chargé avec succès !" })
```

---

*Documentation générée automatiquement depuis le code source de `ui.lua`.*
