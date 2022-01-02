//
//  ProvideGameTexts.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-12.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation

class ProvideGameTexts {
    
    public static var gameTextArray = [""]
    
    var standard_en = ["had a crush on a coworker", "creeped an ex on social media", "eaten a carton of ice cream", "gone commando", "shaved my head", "kissed my best friend", "ghosted someone", "farted in front of a significant other", "gotten a speeding ticket", "gotten a tattoo", "peed in the shower", "slid into someone's DMs", "broken a bone", "dined and dashed", "had a crush on a friend's sibling", "used a fake ID", "cheated in a board game", "met a celebrity", "travelled solo", "snooped through someone's phone", "snuck into a movie theater", "kissed a friend's ex", "screamed during a scary movie", "been called a player", "auditioned for a reality television show", "told my parents I was staying at a friend's house but was really somewhere else", "smoked a cigarette", "been to psychic", "lived alone", "stayed overnight in the hospital", "stayed up all night", "cheated on a test", "gotten in a car accident", "been cheated on", "pretended to be sick to get out of school", "sent a racy text to the wrong person", "stolen anything", "been sent to the principal's office as a kid", "toilet-papered someone's house", "dyed my hair", "read an entire book in a day", "seen an alligator in real life", "won the lottery", "crashed a wedding", "tried marijuana", "saved a life", "went viral online", "ran a marathon", "made a speech in front of 100 people or more", "believed something was haunted", "participated in a protest", "had sleep paralysis", "been the alibi for a lying friend", "dated someone for more than a year", "gone to a nude beach", "asked a stranger to apply sunscreen for me at a beach", "slept in a bed with more than five people", "sent my food back to the chef", "called someone the wrong name while doing it", "created an Instagram just to stalk people", "cut my own hair", "said I am never drinking again", "been grounded", "held a gun", "stolen food from someone’s lunch tray", "challenged an animal to a fight", "farted while squatting in the gym"]

    var standard_se = ["köpt någonting som alldeles uppenbart var stulet", "testsuttit toaletten på en lägenhetsvisning", "dejtat någon som var snygg men otroligt korkad", "varit ovän med min granne", "börjat bråka med någon på ett dansgolv", "varit på en nakenstrand", "ljugit för att skydda en vän som var otrogen", "mjölkat en ko", "fått ett kravbrev från kronofogden", "haft en stor minneslucka efter en utekväll", "hittat en plånbok och snott pengarna i den", "kommit till jobbet berusad", "kopierat en kroppsdel i en kopiator", "raderat foton på ett ex", "blivit utslängd från klubben", "sjukanmält mig på grund av bakfylla", "klippt bort ett märke på ett plagg för att märket var för billigt", "stått utanför systemet och försökt få någon att köpa ut", "hatat en släkting", "bett till gud i ett flygplan för att vara på den säkra sidan", "köpt ett klädesplagg för mer än 5000kr", "ringt brandkåren", "ätit hästkött", "fått en present och googlat vad den kostade", "stulit en cykel", "använt falskleg eller någon annans legitimation", "stulit en drink eller öl från någon annan i en bar", "avtaggat mig själv från ett foto på Facebook", "plankat in på en konsert eller festival", "spenderat över 3000kr på en kväll ute", "fylleringt mitt ex mitt i natten", "hånglat i en skidlift", "köpt något i en butik för att personen som jobbade där var snygg", "hällt ut en öl eller drink över någon", "funderat på att byta efternamn till von Bäversnopp", "tankat fel bränsle i en bil", "varit vaken i 48 timmar i sträck", "hamnat i fyllecell", "tagit en springnota", "haft unibrow", "sugit på min egen stortå", "varit på tinderdejt", "hamnat på sjukhuset efter en utekväll", "ljugit i denna leken...", "snattat", "cyklat och spottat så jag fått det på mig", "haft en näradödenupplevelse"]
 
    var grabbarna_en = ["gone commando", "thought a friend's mom was hot", "been inside Victoria's Secret", "bought lingerie for someone", "kissed another guy", "gone to church in an attempt to meet someone", "cheated on a girlfriend", "been to a strip club", "bought a girl a heart box of chocolates on Valentine's Day", "dressed as a woman", "peeked into the girl's locker room", "owned a Playboy", "cat-called a girl", "used a lame pick-up line on someone", "thought a girlfriend's mom was hotter than her", "done it with a friend's sister", "done it more than four times in a day", "watched Game of Thrones for the incest scenes", "peed in a pool", "been to a bachelorette party or bachelor party", "been in love", "made out in a public place", "gotten into a physical fight", "cheated on someone", "been expelled", "been fired", "used sex dolls", "flirted with a friends parent", "been dominated", "lasted less than a minute", "used porn to get it up", "slept with an older lady", "gotten asked “is it in yet”", "stuck it in the wrong hole", "sent a dick pic", "used a sock when I was…"]
    
    var grabbarna_se = ["tyckt att min kompis mamma var snygg", "Varit inne på Victoria's Secret", "köpt underkläder till någon", "kysst en annan kille", "gått till kyrkan för att ragga", "varit otrogen", "varit på en strippklubb", "tjuvkikat in i tjejernas omklädningsrum", "använt en lame pickup line", "tyckt att en flickväns mamma varit snyggare än flickvännen", "gjort det med en kompis syster", "legat mer än 4 gånger på en dag", "gjort något jag skulle fått fängelse för", "orsakat en trafikolycka", "ljugit om min ålder", "gjort helikoptern, och nästan flugit iväg", "råkat pissa på mig själv i motvind", "fått fortkörningsböter", "blivit anhållen", "odlat en riktigt ful mustasch"]
    
    var tjejerna_en = ["kissed another girl", "not worn a bra in public", "made Barbie and Ken do it", "watched 50 Shades of Grey", "purposely let my thong show to attract someone", "flirted with a boss in an attempt to get a promotion", "rolled up a skirt to make it shorter", "had a crush on my best friend's guy", "faked an orgasm", "been proposed to", "worn heels taller than four inches", "been with more than one person in a day", "given a guy a fake number", "stared at a guy's butt in jeans", "been attracted to someone more than 10 years older or younger than me", "read a romance novel", "hid a hickey with a turtleneck", "had a crush on a teacher", "deleted a post because it didn't get enough likes", "been arrested", "regretted an apology", "pretended I was sick for attention", "spent more than $100 on a top", "thrown a drink at someone", "attempted a trendy diet", "flirted with a friends parent", "taken a shower selfie", "had an onlyfans account", "slept with a younger guy", "washed a piece of clothing because of someone else scent", "snuck into a club", "dropped my phone in the toilet", "cried at a Pixar movie", "punched someone", "had a Sugar Daddy", "taken the morning after pill", "dyed my hair the wrong color", "broke a bed or other furniture during sex"]
    
    var tjejerna_se = ["använt fake-id", "gett ut fel nummer med mening", "kysst en annan tjej", "lekt att Barbie och Ken myser till det", "Sett 50 Shades of Grey", "flörtat med en chef", "haft ett chrush på en bästa väns pojkvän", "fejkat en orgasm", "haft klackar högre än 10 cm", "legat med mer än en person på samma dag", "gett en kille ett fejknummer", "spanat in rumpan på en kille i jeans", "varit attraherad av någon som va 10 år äldre/yngre än mig", "läst en romantisk novell", "gömt ett sugmärke med tröjan", "haft en riktigt snygg lärare", "raderat ett inlägg på grund av för lite likes", "blivit arresterad", "fått fortkörningsböter", "blivit anhållen", "ångrat att jag bett om ursäkt till någon", "flörtat med en kompis förälder", "testat en trendig diet", "tagit en dusch-selfie", "legat med en yngre kille", "smugit in på en klubb", "tappat telefonen i toan", "gråtit till en tecknad film", "slagit någon", "haft en sugar daddy", "färgat mitt hår i fel färg", "råkat göra sönder en möbel under sex"]
    
    var hot_en = ["had sex in a public place", "sent a dirty text to the wrong person", "said the wrong name in bed", "had a friend with benefits", "slept with someone whose name I don't know", "been to an adult store", "had a threesome", "joined the 'mile high' club", "sent a sexy selfie", "had sex in the sea/a swimming pool", "had a one night stand", "faked an orgasm", "flashed someone", "given or received a lap dance", "slept with a co-worker", "gone back to an ex", "been 'walked in on' while having sex", "regretted a sexual experience", "had a sex dream about someone in this room", "had a favourite sex toy", "role-played in bed", "sucked my partner’s toes", "done the walk of shame", "Googled sex positions", "had a sexy nickname", "kissed more than one person in one day", "had to hide a love bite", "slept in the buff", "been skinny dipping", "been caught looking at something naughty", "made out with someone of the same sex", "flirted with a teacher", "been to a nude beach", "watched porn", "played strip poker", "talked to a family member about my sex life", "gotten down in a public transport", "been involved in BDSM", "had an orgy", "gone raw", "lied about my relationship status", "used a strap on", "gotten shaved by my partner", "tied someone up during sex", "eaten ass", "been peed on during sex", "gotten spanked during sex", "had sex with my boss", "used sex to get out of a tough situation", "hooked up with two friends", "gotten dehydrated during a session", "been upset with a partner for not performing well", "screwed around in an elevator", "licked food off someone", "been fooling around in the car and accidentally honked the horn", "kissed a celebrity", "had a dirty crush on somebody in this circle", "showered with the opposite gender", "completed a session without ever laying down", "been accused of being with someone other than my partner", "had to use lubrication", "found myself attracted to my pet", "tried it in the rear", "done it while at a party", "driven a car naked", "exchanged partners with another couple", "had sex in a pool/hot tub", "made noise during sex that caused neighbors to complain", "shared a sex video online", "been in handcuffs and not because of breaking the law", "asked someone to send nudes", "touched myself to a Youtube video", "been approached by a hooker", "had more than 10 sexual partners", "thought about someone else in the bedroom", "asked my parents where i was made", "sat on someones face"]
    
    var hot_se = ["dejtat två personer som är släkt med varandra", "frågat mina föräldrar -var blev jag till?", "haft sex med någon bara för att hämnas på någon annan", "förlåtit en enstaka otrohet", "haft sympatisex med någon jag tyckt synd om", "haft sex med någon vars namn börjar på s", "haft sex på köksbordet", "råkat se en granne naken", "haft sex i en sovsäck", "haft sex med en kompis till ett ex", "haft sex med två personer inom 24 timmar", "varit bunden i sängen", "varit på en nakenstrand", "använt en kondom med smak", "haft sex i en bil", "haft en affär med en gift person", "legat med fler än 15 personer", "fejkat en orgasm", "haft sex på en sandstrand", "stått naken över en spegel för att se hur jag ser ut underifrån", "använt en strap on", "haft sex på allmän plats", "skickat en sext till fel person", "varit i en vuxenleksakaffär", "haft en one night stand", "haft sex i en pool", "skickat nudes", "gett en lap dance", "legat med en kollega", "gått tillbaka till ett ex", "fantiserat om någon i detta rummet", "testat rollspel i sänghalmen", "sugit på min partners tår", "googlat kamasutra-positioner", "strulat med flera personer under samma dag", "nakenbadat", "kysst någon av samma kön", "flörtat med en lärare", "kollat på porr", "spelat strip poker", "pratat med en familjemedlem om mitt sexliv", "varit involverad i BDSM", "haft en orgy", "ljugit om min relationsstatus", "blivit rakat av en partner", "bundit någon annan", "fått eller gett en golden shower", "blivit smiskad", "haft sex med en chef", "använt sex för att komma ur en jobbig situation", "pausat sex på grund av törst/hunger", "kysst en kändis", "duschat med det någon av det andra könet", "haft en session helt utan att ligga ned", "blivit anklagad för otrohet", "använt glidmedel", "känt mig attraherad till mitt husdjur", "haft sex under en pågående fest", "kört bil naken", "bytt partner med ett annat par", "delat en sexvideo online", "varit i handbojor", "tänkt på någon annan under sex", "haft sex med någon som talar ett annat språk", "haft sex i ett rum där det fanns ett djur", "mätt min egen eller någon annans snopp", "haft sex i minst två olika världsdelar", "haft sex i mina föräldrars säng", "legat med någon utan att veta vad personen hette", "kollat sig själv i spegeln under sex", "blivit lite upphetsad när frisören schamponerar mitt hår", "haft sex på en lekplats", "haft Netflix n' chill", "åkt till en annan stad för att ligga", "fått rivmärken","haft sex i naturen", "suttit på någons ansikte", "Med flit låtit underkläder underkläder synas för att attrahera någon"]
    
    var couples_en = ["had a one-night stand", "fallen in love at first sight", "kissed on the first date", "been on a dating website.", "been turned down", "dated more than one person at once", "gone speed dating", "been dumped", "hooked up with someone I met online", "slept with someone twice my age", "hooked up with someone I just met within the first 24 hours", "brought someone home to meet the parents", "spied on an ex online", "had a rebound", "dated someone just to make someone else jealous", "lied about being taken because I wasn't interested in the person", "used Tinder to meet a date", "slept with someone I wasn't attracted to", "flirted with someone when I was taken", "flirted with someone when I knew they were taken", "peeked at someone else while they were changing", "owned a Kama Sutra", "tried a flavored condom", "sent a sext", "nooped through someone’s stuff", "role-played", "slept off during sex", "used sex toys", "sucked on someone’s toes", "watched another couple get it on", "been walked in on by my parents", "watched a friend doing it with their partner", "had a clingy partner", "done a double date", "dreamed about my wedding day", "been kicked out of a bar for making a scandal", "dated more than one person at a time", "ditched a date to spend time alone/with my friends", "done drugs", "doubted my sexual orientation", "had a crush on a celebrity", "had an open relationship", "heard my parent having sex"]
    
    var couples_se = ["bett en främling om en dejt", "varit på en nakenstrand", "använt en kondom med smak", "gömt ett sugmärke", "bytt partner med ett annat par", "gjort en spellista att spela vid sex", "haft en one-night stand", "blivit kär vid första ögonkastet", "kyssts på första dejten", "varit på speed dating", "blivit dumpad", "legat med någon dubbla min ålder", "stalkat på ett ex online", "ljugit om min ålder för att jag inte var intresserad av personen", "dejtat någon bara för att göra någon annan svartsjuk", "ljugit om att ha ett förhållande för att slippa någon", "flörtat med någon jag visste var i ett förhållande", "somnat under sex", "tjuvkikat i det andra könets omklädningsrum", "rollspelat", "haft Tinder", "skickat en sext", "använt vuxenleksaker", "sugit på någons tår", "kollat på när någon annan haft sex", "haft en dubbeldejt", "drömt om min bröllopsdag", "blivit utsparkad från en klubb", "tagit droger", "tvivlad på min sexuella läggning", "haft ett crush på en kändis", "haft ett öppet förhållande"]
    
    var extraStatements_en = ["accidentally sent an inappropriate email to my boss", "made love with someone from university", "done it in the sea", "lied about my age to get laid", "done body shots"]
    
    var extraStatements_se = ["been in a long distance relationship", "gone to church drunk", "been chased by a cat", " chased down an animal while driving", "sipped my number to a waiter"]
    
    
    let prefLanguage = GlobalVariables.preferredLanguage
    
    func fetchFromFB() {
        print("prefLang fetchFromFB \(GlobalVariables.preferredLanguage)")
        let fetchGameTexts = FetchFromFirebase()
        print("gameType: \("Standard" + "_" + prefLanguage)")
        fetchGameTexts.fetchGameTexts(gameType: "Standard" + "_" + prefLanguage) { (result) in
            if result != [] {
                if self.prefLanguage == "sv-SE" {
                    self.standard_se = result
                } else {
                    self.standard_en = result
                }
            }
        }
        fetchGameTexts.fetchGameTexts(gameType: "Grabbarna" + "_" + prefLanguage) { (result) in
            if result != [] {
                if self.prefLanguage == "sv-SE" {
                    self.grabbarna_se = result
                } else {
                    self.grabbarna_en = result
                }
            }
        }
        fetchGameTexts.fetchGameTexts(gameType: "Tjejerna" + "_" + prefLanguage) { (result) in
            if result != [] {
                if self.prefLanguage == "sv-SE" {
                    self.tjejerna_se = result
                } else {
                    self.tjejerna_en = result
                }
                
            }
        }
        fetchGameTexts.fetchGameTexts(gameType: "Hot" + "_" + prefLanguage) { (result) in
            if result != [] {
                if self.prefLanguage == "sv-SE" {
                    self.hot_se = result
                } else {
                    self.hot_en = result
                }
                
            }
        }
        fetchGameTexts.fetchGameTexts(gameType: "Couples" + "_" + prefLanguage) { (result) in
            if result != [] {
                if self.prefLanguage == "sv-SE" {
                    self.couples_se = result
                } else {
                    self.couples_en = result
                }
            }
        }
    }
    
    func setGameText(gameType : String) {

        switch gameType {
        case "Standard":
            if prefLanguage == "sv-SE" {
                GlobalVariables.gameTextArray = standard_se
            } else {
                GlobalVariables.gameTextArray = standard_en
            }
        case "Grabbarna":
            if prefLanguage == "sv-SE" {
                GlobalVariables.gameTextArray = grabbarna_se
            } else {
                GlobalVariables.gameTextArray = grabbarna_en
            }
        case "Tjejerna":
            if prefLanguage == "sv-SE" {
                GlobalVariables.gameTextArray = tjejerna_se
            } else {
                GlobalVariables.gameTextArray = tjejerna_en
            }
        case "Hot":
            if prefLanguage == "sv-SE" {
                GlobalVariables.gameTextArray = hot_se
            } else {
                GlobalVariables.gameTextArray = hot_en
            }
        case "Couples":
            if prefLanguage == "sv-SE" {
                GlobalVariables.gameTextArray = couples_se
            } else {
                GlobalVariables.gameTextArray = couples_en
            }
        default:
            GlobalVariables.gameTextArray = standard_en
        }
    }
}


