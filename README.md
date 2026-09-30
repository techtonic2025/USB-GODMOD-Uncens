# USB GODMOD Uncens

Interfaccia portatile, open source e senza installazione per interrogare e confrontare fino a quattro modelli AI disponibili su [OpenRouter](https://openrouter.ai/).

Il progetto è pensato per essere copiato su una chiavetta USB oppure scaricato come archivio ZIP. Non contiene modelli AI e non esegue inferenze sul computer: il browser invia le richieste direttamente a OpenRouter usando la chiave API dell'utente.

> **Nota importante:** “uncensored” indica modelli descritti come poco filtrati o progettati per una maggiore libertà di risposta. Non garantisce che un modello risponda a qualsiasi richiesta: comportamento, policy e disponibilità dipendono dal modello e dal provider.

## Funzioni principali

- catalogo dei modelli caricato direttamente e in tempo reale da OpenRouter;
- selezione manuale di uno, due, tre o quattro modelli;
- filtro per mostrare soltanto modelli probabilmente uncensored o poco filtrati;
- pulsante **Auto: migliori 4 uncensored**;
- invio parallelo dello stesso prompt a tutti i modelli selezionati;
- risposte visualizzate affiancate;
- indicazione del modello, durata, token, costo disponibile o stimato e motivo di terminazione;
- rilevamento euristico dei possibili rifiuti;
- nessun backend obbligatorio e nessuna telemetria applicativa;
- configurazione esportabile e importabile come file JSON;
- API key mantenuta soltanto in memoria, salvo scelta esplicita dell'utente.

## Modalità disponibili

### NORMAL / RAW

Invia il prompt esattamente come messaggio dell'utente. Non aggiunge system prompt, trasformazioni, classificatori o altre istruzioni.

È normalmente la modalità migliore per verificare il comportamento autentico di un modello e può funzionare particolarmente bene con modelli già progettati come uncensored.

### GODMODE

Aggiunge una direttiva di sistema semplificata, derivata concettualmente da G0DM0D3 CLASSIC, che richiede una risposta diretta, precisa e dettagliata, riducendo preamboli, esitazioni e formulazioni eccessivamente prudenti.

È la modalità più esplicitamente orientata alla permissività, ma non può eliminare i filtri applicati dal modello o dal provider.

### ULTRAPLINIAN LITE

Interroga parallelamente tutti i modelli selezionati con una direttiva orientata a correttezza, completezza e utilità. Mostra tutte le risposte senza utilizzare un ulteriore modello giudice, evitando una chiamata e un costo aggiuntivi.

## Avvio rapido

### Metodo consigliato su Windows

1. Scaricare il repository tramite **Code → Download ZIP**.
2. Estrarre l'archivio oppure copiarlo sulla chiavetta USB.
3. Avviare `start.bat`.
4. Inserire la propria OpenRouter API key.
5. Premere **Aggiorna modelli**.
6. Selezionare fino a quattro modelli, oppure premere **Auto: migliori 4 uncensored**.
7. Scrivere il prompt, scegliere la modalità e premere **Esegui confronto**.

Il launcher usa un piccolo server HTTP locale quando trova un'installazione funzionante di Python. Nessun dato viene inviato al server locale. Se Python non è disponibile, apre direttamente `index.html`.

### Avvio senza launcher

Aprire direttamente `index.html` con un browser moderno. Alcune configurazioni possono limitare le richieste di rete provenienti da pagine `file://`; in quel caso utilizzare `start.bat` o un normale server statico locale.

## Requisiti

- Windows, macOS o Linux con un browser moderno;
- connessione Internet;
- account e API key OpenRouter;
- credito OpenRouter per i modelli a pagamento, oppure scelta di endpoint gratuiti quando disponibili.

Non sono necessari GPU, installazione di modelli, Node.js o un server remoto personale.

## Come vengono scelti i modelli “uncensored”

Il filtro usa i dati del catalogo OpenRouter aggiornato — identificativo, nome e descrizione — insieme a una graduatoria locale di famiglie note per essere più orientate alla libertà di risposta.

La priorità viene data a:

1. modelli esplicitamente descritti come `uncensored`, `unfiltered`, `abliterated` o `de-aligned`;
2. Venice Uncensored / Dolphin Venice;
3. famiglie Hermes ad alta capacità;
4. famiglie come Cydonia, Euryale, Rocinante, MythoMax e simili, se presenti nel catalogo.

Il catalogo viene aggiornato quando si preme **Aggiorna modelli**. La graduatoria è euristica e non costituisce una garanzia sul comportamento futuro.

## Costi

Ogni modello interrogato rappresenta una richiesta distinta. Se vengono selezionati quattro modelli, OpenRouter può addebitare quattro inferenze.

L'interfaccia mostra:

- token di input e output restituiti dall'API;
- costo comunicato dalla risposta, quando presente;
- in alternativa, una stima basata sui prezzi pubblicati nel catalogo OpenRouter.

Si raccomanda di creare una chiave dedicata con un limite di spesa.

## Privacy e sicurezza

- Il progetto non contiene telemetria applicativa.
- Prompt e risposte non vengono salvati dall'applicazione.
- Le richieste vengono inviate direttamente dal browser a OpenRouter.
- La chiave API non è inclusa nel codice o nei file di configurazione esportati.
- L'opzione **Ricorda la chiave** è disattivata per impostazione predefinita.
- Se attivata, la chiave viene salvata nel `localStorage` del profilo browser in uso.
- OpenRouter e i provider dei modelli applicano le proprie condizioni e politiche di trattamento dei dati.

Su computer condivisi non attivare il salvataggio della chiave. In caso di compromissione o smarrimento, revocarla immediatamente dal proprio account OpenRouter.

## Portabilità della configurazione

Il `localStorage` appartiene al browser e non alla chiavetta USB. I pulsanti **Esporta** e **Importa** permettono di trasferire la selezione dei modelli e la modalità tramite un file JSON. La API key non viene mai inclusa nell'esportazione.

## Struttura del progetto

```text
USB-GODMOD-Uncens/
├── index.html                 # Applicazione completa HTML/CSS/JavaScript
├── start.bat                  # Launcher Windows
├── README.md                  # Documentazione principale
├── README-PORTABLE.md         # Note operative per la versione portatile
├── LICENSE                    # GNU AGPL v3.0
└── THIRD_PARTY_NOTICES.md     # Attribuzioni
```

## Progetto di origine

Questa variante è derivata e semplificata a partire dal progetto open-source [elder-plinius/G0DM0D3](https://github.com/elder-plinius/G0DM0D3). Riutilizza concetti dell'interfaccia, del trasporto OpenRouter e delle modalità comparative, concentrandosi su un flusso portatile essenziale.

Non è un prodotto ufficiale di OpenRouter e non è affiliato o approvato da OpenRouter.

## Licenza

Il progetto è distribuito secondo la **GNU Affero General Public License v3.0**. Le opere derivate e le modifiche distribuite devono rispettare i termini della medesima licenza. Consultare [LICENSE](LICENSE) e [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

## Uso responsabile

L'utente è responsabile dei prompt inviati, delle risposte ottenute, dei costi generati e del rispetto delle leggi, delle condizioni di OpenRouter e delle condizioni applicabili ai singoli provider.
