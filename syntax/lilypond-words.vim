syn match lilyKeyword "[-_^]\?\\\(with\|whiteTriangleMarkup\|voiceTwo\|voiceThree\|voiceOne\|voiceFour\|virgula\|virga\|verylongfermata\|version\|varcoda\|upprall\|upmordent\|upbow\|up\|unset\|unit\|unfoldRepeats\|unaCorda\|unHideNotes\|type\|tweak\|turn\|tupletUp\|tupletNeutral\|tupletDown\|trill\|treCorde\|transposition\|transpose\|tiny\|times\|time\|tildeSymbol\|tieUp\|tieSolid\|tieNeutral\|tieDown\|tieDotted\|tieDashed\|thumb\|textSpannerUp\|textSpannerNeutral\|textSpannerDown\|tenuto\|tempo\|tag\|sustainUp\|sustainDown\|stropha\|stopped\|stopTrillSpan\|stopTextSpan\|stopStaff\|stopGroup\|stopGraceMusic\|stopAppoggiaturaMusic\|stopAcciaccaturaMusic\|stop\|stemUp\|stemNeutral\|stemDown\|startTrillSpan\|startTextSpan\|startStaff\|startGroup\|startGraceMusic\|startAppoggiaturaMusic\|startAcciaccaturaMusic\|start\|staccato\|staccatissimo\|spp\|spacingTweaks\|sp\|sostenutoUp\|sostenutoDown\|smaller\|small\|slurUp\|slurSolid\|slurNeutral\|slurDown\|slurDotted\|slurDashed\|skipTypesetting\|skip\|simultaneous\|signumcongruentiae\|showStaffSwitch\|shortfermata\|shiftOnnn\|shiftOnn\|shiftOn\|shiftOff\|shiftDurations\|sfz\|sfp\|sff\|sf\|setTextDim\|setTextDecresc\|setTextCresc\|setHairpinDim\|setHairpinDecresc\|setHairpinCresc\|setEasyHeads\|setDefaultDurationToQuarter\|set\|sequential\|semicirculus\|semiGermanChords\|segno\|score\|sacredHarpHeads\|rtoe\|right\|rheel\|rfz\|revert\|reverseturn\|rest\|repeatTie\|repeat\|removeWithTag\|remove\|relative\|recordEventSequence\|quoteDuring\|quilisma\|pt\|prallup\|prallprall\|prallmordent\|pralldown\|prall\|ppppp\|pppp\|ppp\|pp\|portato\|pitchedTrill\|pipeSymbol\|phrygian\|phrasingSlurUp\|phrasingSlurNeutral\|phrasingSlurDown\|pes\|partialJazzMusic\|partialJazzExceptions\|partial\|partcombine\|partCombineListener\|parenthesize\|parenthesisOpenSymbol\|parenthesisCloseSymbol\|parallelMusic\|paper\|pageBreak\|p\|overrideProperty\|override\|oriscus\|open\|oneVoice\|once\|oldaddlyrics\|octave\|objectid\|notemode\|normalsize\|noPageBreak\|noBreak\|noBeam\|new\|neumeDemoLayout\|name\|musicMap\|mp\|mordent\|mm\|mixolydian\|minor\|midi\|mf\|melismaEnd\|melisma\|maxima\|markup\|mark\|marcato\|makeClusters\|major\|maininput\|lyricsto\|lyrics\|lyricmode\|lydian\|ltoe\|longfermata\|longa\|locrian\|lineprall\|linea\|ligature\|lheel\|left\|layout\|laissezVibrer\|killCues\|key\|keepWithTag\|italianChords\|ionian\|include\|inclinatum\|in\|improvisationOn\|improvisationOff\|ignoreBarChecks\|ignatzekExceptions\|ignatzekExceptionMusic\|ictus\|hideStaffSwitch\|hideNotes\|header\|harmonic\|grobdescriptions\|grace\|glissando\|germanChords\|fz\|fullJazzExceptions\|frenchChords\|fp\|flexa\|flageolet\|finalis\|figures\|figuremode\|ffff\|fff\|ff\|fermataMarkup\|fermata\|fatText\|espressivo\|escapedSmallerSymbol\|escapedParenthesisOpenSymbol\|escapedParenthesisCloseSymbol\|escapedExclamationSymbol\|escapedBiggerSymbol\|episemInitium\|episemFinis\|endincipit\|enddim\|enddecr\|endcresc\|endcr\|emptyText\|dynamicUp\|dynamicNeutral\|dynamicDown\|drums\|drummode\|downprall\|downmordent\|downbow\|down\|dotsUp\|dotsNeutral\|dotsDown\|dorian\|divisioMinima\|divisioMaxima\|divisioMaior\|displayMusic\|displayLilyMusic\|dim\|description\|descendens\|denies\|deminutum\|defaultchild\|default\|decr\|dashUnderscore\|dashPlus\|dashLarger\|dashHat\|dashDot\|dashDash\|dashBar\|cueDuring\|cresc\|cr\|context\|consists\|compressMusic\|coda\|cm\|clef\|circulus\|chords\|chordmodifiers\|chordmode\|change\|center\|cavum\|caesura\|cadenzaOn\|cadenzaOff\|breve\|breathe\|break\|bracketOpenSymbol\|bracketCloseSymbol\|book\|blackTriangleMarkup\|bigger\|barNumberCheck\|bar\|autochange\|autoBeamOn\|autoBeamOff\|auctum\|assertBeamSlope\|assertBeamQuant\|ascendens\|arpeggioUp\|arpeggioNeutral\|arpeggioDown\|arpeggioBracket\|arpeggio\|appoggiatura\|applyOutput\|applyMusic\|applyContext\|alternative\|alias\|aikenHeads\|afterGraceFraction\|afterGrace\|aeolian\|addquote\|addlyrics\|acciaccatura\|accepts\|accentus\|accent\|RemoveEmptyStaffContext\|RemoveEmptyRhythmicStaffContext\|AncientRemoveEmptyStaffContext\|n\)\(\A\|\n\)"me=e-1
syn match lilyReservedWord "\(\A\|\n\)\(Volta_engraver\|Voice\|Vertically_spaced_contexts_engraver\|Vertical_align_engraver\|Vaticana_ligature_engraver\|VaticanaVoice\|VaticanaStaff\|Tweak_engraver\|Tuplet_engraver\|Trill_spanner_engraver\|Timing_translator\|Time_signature_performer\|Time_signature_engraver\|Tie_performer\|Tie_engraver\|Text_spanner_engraver\|Text_engraver\|Tempo_performer\|Tab_staff_symbol_engraver\|Tab_note_heads_engraver\|TabVoice\|TabStaff\|System_start_delimiter_engraver\|Swallow_performer\|Swallow_engraver\|String_number_engraver\|Stem_engraver\|Stanza_number_engraver\|Stanza_number_align_engraver\|Staff_symbol_engraver\|Staff_performer\|Staff_collecting_engraver\|StaffGroup\|Staff\|Span_dynamic_performer\|Span_bar_engraver\|Span_arpeggio_engraver\|Spacing_engraver\|Slur_performer\|Slur_engraver\|Slash_repeat_engraver\|Skip_event_swallow_translator\|Separating_line_group_engraver\|Script_engraver\|Script_column_engraver\|Score\|Rhythmic_column_engraver\|RhythmicStaff\|Rest_swallow_translator\|Rest_engraver\|Rest_collision_engraver\|Repeat_tie_engraver\|Repeat_acknowledge_engraver\|Pitched_trill_engraver\|Pitch_squash_engraver\|Piano_pedal_performer\|Piano_pedal_engraver\|PianoStaff\|Phrasing_slur_engraver\|Percent_repeat_engraver\|Part_combine_engraver\|Parenthesis_engraver\|Paper_column_engraver\|Output_property_engraver\|Ottava_spanner_engraver\|Note_swallow_translator\|Note_performer\|Note_name_engraver\|Note_heads_engraver\|Note_head_line_engraver\|NoteNames\|New_fingering_engraver\|Multi_measure_rest_engraver\|Metronome_mark_engraver\|Mensural_ligature_engraver\|MensuralVoice\|MensuralStaff\|Melisma_translator\|Mark_engraver\|Lyrics\|Lyric_performer\|Lyric_engraver\|Ligature_bracket_engraver\|Ledger_line_engraver\|Laissez_vibrer_engraver\|Key_performer\|Key_engraver\|Instrument_name_engraver\|InnerStaffGroup\|InnerChoirStaff\|Hyphen_engraver\|Hara_kiri_engraver\|Grob_pq_engraver\|GregorianTranscriptionVoice\|GregorianTranscriptionStaff\|GrandStaff\|Grace_engraver\|Grace_beam_engraver\|Global\|Glissando_engraver\|Forbid_line_break_engraver\|Font_size_engraver\|Fingering_engraver\|Figured_bass_engraver\|FiguredBass\|Extender_engraver\|Dynamic_performer\|Dynamic_engraver\|Drum_notes_engraver\|Drum_note_performer\|DrumVoice\|DrumStaff\|Dot_column_engraver\|Devnull\|Default_bar_line_engraver\|Custos_engraver\|CueVoice\|Collision_engraver\|Cluster_spanner_engraver\|Clef_engraver\|Chord_tremolo_engraver\|Chord_name_engraver\|ChordNames\|ChordNameVoice\|ChoirStaff\|Breathing_sign_engraver\|Break_align_engraver\|Beam_performer\|Beam_engraver\|Bar_number_engraver\|Bar_engraver\|Axis_group_engraver\|Auto_beam_engraver\|Arpeggio_engraver\|Accidental_engraver\|Score\)\(\A\|\n\)"ms=s+1,me=e-1
syn match lilyNote "\<\(\(\(R\|vibraslap\|twoup\|twodown\|triangle\|threeup\|threedown\|tambourine\|splashcymbal\|solstqt\|solss\|solsqt\|solsd\|solsb\|sols\|solkk\|solk\|soldsd\|soldd\|sold\|solbtqt\|solbsb\|solbqt\|solbb\|solb\|sol\|snare\|sistqt\|siss\|sisqt\|sisd\|sisb\|sis\|sikk\|sik\|sidsd\|sidestick\|sidd\|sid\|sibtqt\|sibsb\|sibqt\|sibb\|sib\|si\|shortwhistle\|shortguiro\|ridecymbalb\|ridecymbala\|ridecymbal\|ridebell\|restqt\|ress\|resqt\|resd\|resb\|res\|rekk\|rek\|redsd\|redd\|red\|rebtqt\|rebsb\|rebqt\|rebb\|reb\|re\|pedalhihat\|opentriangle\|openloconga\|openlobongo\|openhihat\|openhiconga\|openhibongo\|opencuica\|oneup\|onedown\|mutetriangle\|muteloconga\|mutelobongo\|mutehiconga\|mutehibongo\|mutecuica\|mistqt\|miss\|misqt\|misd\|misb\|mis\|mikk\|mik\|midsd\|midd\|mid\|mibtqt\|mibsb\|mibqt\|mibb\|mib\|mi\|maracas\|lowtom\|lowoodblock\|lowmidtom\|lowfloortom\|lotimbale\|losidestick\|longwhistle\|longguiro\|loconga\|lobongo\|loagogo\|lastqt\|lass\|lasqt\|lasd\|lasb\|las\|lakk\|lak\|ladsd\|ladd\|lad\|labtqt\|labsb\|labqt\|labb\|lab\|la\|hiwoodblock\|hitimbale\|hississ\|hiss\|hisis\|hisidestick\|his\|himidtom\|hihat\|hih\|hightom\|highfloortom\|hiconga\|hibongo\|hiagogo\|hessess\|heses\|handclap\|halfopenhihat\|h\|gx\|guiro\|gss\|gsharpsharp\|gsharp\|gs\|gississ\|giss\|gisis\|gisih\|gis\|gih\|gflatflat\|gflat\|gff\|gf\|gessess\|gess\|geses\|geseh\|ges\|geh\|g\|fx\|fss\|fsharpsharp\|fsharp\|fs\|fourup\|fourdown\|fiveup\|fivedown\|fississ\|fiss\|fisis\|fisih\|fis\|fih\|fflatflat\|fflat\|fff\|ff\|fessess\|fess\|feses\|feseh\|fes\|feh\|fastqt\|fass\|fasqt\|fasd\|fasb\|fas\|fakk\|fak\|fadsd\|fadd\|fad\|fabtqt\|fabsb\|fabqt\|fabb\|fab\|fa\|f\|ex\|essess\|ess\|esharpsharp\|esharp\|eses\|es\|electricsnare\|eississ\|eiss\|eisis\|eisih\|eis\|eih\|eflatflat\|eflat\|eff\|ef\|eessess\|eess\|eeses\|eeseh\|ees\|eeh\|e\|dx\|dss\|dsharpsharp\|dsharp\|ds\|dostqt\|doss\|dosqt\|dosd\|dosb\|dos\|dokk\|dok\|dodsd\|dodd\|dod\|dobtqt\|dobsb\|dobqt\|dobb\|dob\|do\|dississ\|diss\|disis\|disih\|dis\|dih\|dflatflat\|dflat\|dff\|df\|dessess\|dess\|deses\|deseh\|des\|deh\|d\|cx\|css\|csharpsharp\|csharp\|cs\|crashcymbalb\|crashcymbala\|crashcymbal\|cowbell\|closedhihat\|claves\|cississ\|ciss\|cisis\|cisih\|cis\|cih\|chinesecymbal\|cflatflat\|cflat\|cff\|cf\|cessess\|cess\|ceses\|ceseh\|ces\|ceh\|cabasa\|c\|bx\|bss\|bsharpsharp\|bsharp\|bs\|bisis\|bisih\|bis\|bih\|bflatflat\|bflat\|bff\|bf\|bess\|beses\|beseh\|bes\|beh\|bb\|bassdrum\|b\|ax\|assess\|ass\|asharpsharp\|asharp\|ases\|asas\|as\|aississ\|aiss\|aisis\|aisih\|ais\|aih\|aflatflat\|aflat\|aff\|af\|aessess\|aess\|aeses\|aeseh\|aes\|aeh\|acousticsnare\|acousticbassdrum\|a\|a\)\([,']\)\{,4}\([?!]\)\?\)\|s\|r\)\(\(128\|64\|32\|16\|8\|4\|2\|1\|\\breve\|\\longa\|\\maxima\)[.]\{,8}\)\?\(\A\|\n\)"me=e-1
