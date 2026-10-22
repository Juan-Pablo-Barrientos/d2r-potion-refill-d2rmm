# Potion Refill for D2RMM

A [D2RMM](https://github.com/olegbl/d2rmm) mod for the
[Potion Refill](https://github.com/Juan-Pablo-Barrientos/d2r-potion-refill)
D2RLoader plugin. When you drink a potion from your belt, a matching potion
from your inventory moves into the same belt column. This mod lets you set the
plugin's options in D2RMM.

## Settings

| Setting | What it does |
| --- | --- |
| Enabled | Turns the refill on or off. |
| Matching | **Same kind**: any healing potion refills healing, any mana potion refills mana, any rejuvenation potion refills rejuvenation. The same potion is used first, then the closest size. **Exact potion**: only the same potion, such as Super Healing for Super Healing. |
| Log refills | Writes every refill to `d2rloader\logs\potion-refill.log`. |

## Install

Download `PotionRefill-D2RMM.zip` from the
[latest release](../../releases/latest). It has two parts, and each goes in a
different place:

| In the zip | What it is | Where it goes |
| --- | --- | --- |
| `d2rl-potion-refill.dll` | The plugin. It refills your belt. | `<game folder>\d2rloader\plugins\` |
| `PotionRefill\` | The plugin's settings page in D2RMM. | D2RMM's `mods` folder |

1. Install [D2RLoader](https://d2rloader.net). Tested with 1.3.1-beta.
2. Copy `d2rl-potion-refill.dll` into `<game folder>\d2rloader\plugins\`.
3. Copy the `PotionRefill` folder into D2RMM's `mods` folder. Enable it,
   choose your settings, and click **Install Mods**.
4. Start the game with D2RLoader using D2RMM's output mod. For example, set
   `default_mod = "D2RMM"` in `d2rloader\config\d2rloader.toml`.

Step 3 is optional. Without it, the plugin uses its default settings.

### Why D2RMM doesn't install the plugin

D2RMM only lets mods write inside its own output mod
(`mods\D2RMM\D2RMM.mpq`). D2RLoader loads plugins only from
`<game>\d2rloader\plugins` or `<game>\mods\<mod>\d2rloader\plugins`, which are
outside that folder. D2RMM reinstalls don't touch the plugins folder, so you
copy the DLL only once, and again when the plugin updates.

## How it works

When D2RMM installs the mod, `mod.js` writes your choices to
`data\d2rloader\potion-refill\settings.toml` in D2RMM's output mod. The plugin
reads that file at startup. Its log then shows
`Using settings from the active mod`.

## Build a release

```powershell
.\package.ps1                         # downloads the plugin DLL from its latest release
.\package.ps1 -Dll path\to\d2rl-potion-refill.dll
```

This writes `dist\PotionRefill-D2RMM.zip`.

## License

MIT. See [LICENSE](LICENSE).
