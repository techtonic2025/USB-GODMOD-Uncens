# G0DM0D3 Portable Compare

Interfaccia statica portatile per confrontare fino a quattro modelli OpenRouter. È una variante semplificata derivata dal progetto open-source [elder-plinius/G0DM0D3](https://github.com/elder-plinius/G0DM0D3).

## Avvio

1. Copiare l'intera cartella sulla chiavetta USB.
2. Avviare il launcher del proprio sistema: `start.bat` su Windows, `start.command` su macOS oppure `start.sh` su Linux. I launcher usano un server locale su `127.0.0.1:8765`.
3. Inserire una OpenRouter API key.
4. Premere **Aggiorna modelli**, selezionare fino a quattro modelli e scegliere RAW, GODMODE o ULTRAPLINIAN LITE.

Il filtro **solo modelli probabilmente uncensored** usa nome, descrizione e famiglia del catalogo OpenRouter aggiornato. **Auto: migliori 4 uncensored** sceglie automaticamente fino a quattro candidati disponibili, dando priorità ai modelli esplicitamente descritti come uncensored e poi alle famiglie note per una minore filtratura. La classificazione è euristica: disponibilità, comportamento e policy del provider possono cambiare e nessun modello è garantito come privo di rifiuti in ogni situazione.

Dopo aver cercato e selezionato modelli diversi, attivare **Mostra solo i modelli selezionati** per visualizzare insieme la selezione finale. Il campo di ricerca viene azzerato automaticamente, così nessuno dei quattro modelli resta nascosto dal filtro precedente.

`index.html` può anche essere aperto direttamente. Alcune configurazioni del browser possono però limitare richieste di rete provenienti da pagine `file://`; il piccolo server locale evita questa differenza senza inviare dati a un server esterno.

Su macOS, al primo avvio potrebbe essere necessario fare clic destro su `start.command` e scegliere **Apri**. Su Linux, se il file perde il permesso eseguibile durante l'estrazione, eseguire `chmod +x start.sh` una sola volta.

## Modalità

- **NORMAL / RAW:** invia il prompt esattamente come messaggio utente, senza system prompt, trasformazioni o classificatori.
- **GODMODE:** aggiunge una direttiva di risposta diretta, accurata e poco prolissa, derivata dalla logica del progetto originale.
- **ULTRAPLINIAN LITE:** esegue la stessa gara parallela sui modelli scelti e mostra tutte le risposte. Non usa un modello giudice aggiuntivo, evitando una chiamata e un costo supplementari.

## Privacy

- Non è presente codice di telemetria.
- Non esiste un backend G0DM0D3: il browser comunica direttamente con `openrouter.ai`.
- La chiave resta in memoria per impostazione predefinita.
- **Ricorda la chiave** la salva nel `localStorage` del browser ed è intenzionalmente disattivato di default.
- Esportazione e importazione salvano soltanto modelli selezionati e modalità, mai la chiave.
- Prompt e risposte non sono salvati dall'app. OpenRouter e i provider selezionati applicano le proprie politiche di trattamento dati.

## Dati visualizzati

La scheda di ogni modello mostra durata misurata nel browser, token dichiarati dalla risposta, costo quando fornito o stimabile dal listino del catalogo, `finish_reason` e un'indicazione euristica di possibile rifiuto. L'indicazione di rifiuto può produrre falsi positivi o falsi negativi.

## Configurazione sulla USB

Il `localStorage` appartiene al profilo del browser, non alla chiavetta. Usare **Esporta** per salvare `g0dmod3-portable-config.json` sulla USB e **Importa** su un altro computer.

## Sicurezza operativa

- Creare su OpenRouter una chiave dedicata con limite di spesa.
- Non attivare il salvataggio della chiave sui computer condivisi.
- Revocare la chiave da OpenRouter in caso di smarrimento della chiavetta o del computer.
- Quattro richieste parallele possono addebitare quattro inferenze indipendenti.

## Licenza e attribuzione

Distribuito secondo GNU AGPL v3.0. Il file `LICENSE` accompagna questa variante. Le parti concettuali e visive riutilizzate provengono da G0DM0D3 di Elder Plinius e collaboratori. Le modifiche della variante portatile restano soggette alla medesima licenza.
