;TODO: 
; - fake generator
; - define if length reached


locals := ["ru","en"]

fakeData := {en : {}, ru : {}} ;main data array


;-------------------------------Utility
getLocalsRE(){
    global locals
    res := "("
    length := locals.MaxIndex()
    Loop, %length%
    {
        res .= locals[a_index] . "|"
    }
    res := substr(res, 1, -1) . ")"
    return res
}
;------------------------------------Util
alphabetes := { ru : "абвгдеёжзийклмнопрстуфхцчшщъыьэюя", en: "abcdefghijklmnopqrstuvwxyz"}
randNum(a,b){
    if (!a && a != 0){
        a := 0
    }
    if (!b && b != 0){
        b := 9
    }
    Random, res, %a%, %b% ;number to be used as lorem version.
    return res
}
randChar(loc){
    global alphabetes
    if (!loc){
        loc := locals[1]
    }
    alphLen := alphabetes[loc].maxIndex()
    letter := alphabetes[loc][randNum(1,alphLen)]
    if (randNum(0,1)) {
        StringUpper letter, letter
    }
    return letter
}
randFrom(range){
    if (!range) return 0
    len := range.maxIndex()
    index := randNum(1,len)
    return range[index]
}

;fill string with letters instead of ? and digits instead of #
lexnum(string, local)
{
    if (!string){
        string := "###"
    }
    if (!local){
        local := "en"
    }
    Loop, Parse, string
    {
        if (A_LoopField == "#") {
            string[A_index] := randNum(0,9)
        } else if (A_LoopField == "?"){
            string[a_index] := randChar(local)
        }
    }
    return string
}


;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ Main method
getFake(request){    
    ;parse request
    if (RegExMatch(request, "^lorem")){
        return getLorem(request)
    } else if (RegExMatch(request, "^addr")) {
        return getAddress(request)

    } else if (RegExMatch(request, "^phone")) {
        return getPhone(request)

    } else if (RegExMatch(request, "^mail")) {
        return getMail(request)

    } else if (RegExMatch(request, "^name")) {
        return getName(request)

    } else if (RegExMatch(request, "^date")) {
        return getDate(request)

    } else if (RegExMatch(request, "^time")) {
        return getTime(request)

    }
    return false
}


;-------------------------Lorem Ipsum generator
; Syntax is following: [lorem[ 20]|[ w5]|[ s5]|[ p3] [ Locale]]

fakeData["en"]["lorem"] := array("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Phasellus consectetuer vestibulum elit. Aenean tellus metus, bibendum sed, posuere ac, mattis non, nunc. Vestibulum fringilla pede sit amet augue. In turpis. Pellentesque posuere. Praesent turpis. Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Donec elit libero, sodales nec, volutpat a, suscipit non, turpis. Nullam sagittis. Suspendisse pulvinar, augue ac venenatis condimentum, sem libero volutpat nibh, nec pellentesque velit pede quis nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce id purus. Ut varius tincidunt libero. Phasellus dolor. Maecenas vestibulum mollis diam. Pellentesque ut neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dui magna, posuere eget, vestibulum et, tempor auctor, justo. In ac felis quis tortor malesuada pretium. Pellentesque auctor neque nec urna. Proin sapien ipsum, porta a, auctor quis, euismod ut, mi. Aenean viverra rhoncus pede. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut non enim eleifend felis pretium feugiat. Vivamus quis mi. Phasellus a est. Phasellus magna. In hac habitasse platea dictumst. Curabitur at lacus ac velit ornare lobortis. Curabitur a felis in nunc fringilla tristique. Morbi mattis ullamcorper velit. Phasellus gravida semper nisi. Nullam vel sem. Pellentesque libero tortor, tincidunt et, tincidunt eget, semper nec, quam. Sed hendrerit. Morbi ac felis. Nunc egestas, augue at pellentesque laoreet, felis eros vehicula leo, at malesuada velit leo quis pede. Donec interdum, metus et hendrerit aliquet, dolor diam sagittis ligula, eget egestas libero turpis vel mi. Nunc nulla. Fusce risus nisl, viverra et, tempor et, pretium in, sapien. Donec venenatis vulputate lorem. Morbi nec metus. Phasellus blandit leo ut odio. Maecenas ullamcorper, dui et placerat feugiat, eros pede varius nisi, condimentum viverra felis nunc et lorem. Sed magna purus, fermentum eu, tincidunt eu, varius ut, felis. In auctor lobortis lacus. Quisque libero metus, condimentum nec, tempor a, commodo mollis, magna. Vestibulum ullamcorper mauris at ligula. Fusce fermentum. Nullam cursus lacinia erat. Praesent blandit laoreet nibh. Fusce convallis metus id felis luctus adipiscing. Pellentesque egestas, neque sit amet convallis pulvinar, justo nulla eleifend augue, ac auctor orci leo non est. Quisque id mi. Ut tincidunt tincidunt erat. Etiam feugiat lorem non metus. Vestibulum dapibus nunc ac augue. Curabitur vestibulum aliquam leo. Praesent egestas neque eu enim. In hac habitasse platea dictumst. Fusce a quam. Etiam ut purus mattis mauris sodales aliquam. Curabitur nisi. Quisque malesuada placerat nisl. Nam ipsum risus, rutrum vitae, vestibulum eu, molestie vel, lacus. Sed augue ipsum, egestas nec, vestibulum et, malesuada adipiscing, dui. Vestibulum facilisis, purus nec pulvinar iaculis, ligula mi congue nunc, vitae euismod ligula urna in dolor. Mauris sollicitudin fermentum libero. Praesent nonummy mi in odio. Nunc interdum lacus sit amet orci. Vestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi. Morbi mollis tellus ac sapien. Phasellus volutpat, metus eget egestas mollis, lacus lacus blandit dui, id egestas quam mauris ut lacus. Fusce vel dui. Sed in libero ut nibh placerat accumsan. Proin faucibus arcu quis ante. In consectetuer turpis ut velit. Nulla sit amet est. Praesent metus tellus, elementum eu, semper a, adipiscing nec, purus. Cras risus ipsum, faucibus ut, ullamcorper id, varius ac, leo. Suspendisse feugiat. Suspendisse enim turpis, dictum sed, iaculis a, condimentum nec, nisi. Praesent nec nisl a purus blandit viverra. Praesent ac massa at ligula laoreet iaculis. Nulla neque dolor, sagittis eget, iaculis quis, molestie non, velit. Mauris turpis nunc, blandit et, volutpat molestie, porta ut, ligula. Fusce pharetra convallis urna. Quisque ut nisi. Donec mi odio, faucibus at, scelerisque quis, convallis in, nisi. Suspendisse non nisl sit amet velit hendrerit rutrum. Ut leo. Ut a nisl id ante tempus hendrerit. Proin pretium, leo ac pellentesque mollis, felis nunc ultrices eros, sed gravida augue augue mollis justo. Suspendisse eu ligula. Nulla facilisi. Donec id justo. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi sem ut ipsum. Curabitur suscipit suscipit tellus. Praesent vestibulum dapibus nibh. Etiam iaculis nunc ac metus. Ut id nisl quis enim dignissim sagittis. Etiam sollicitudin, ipsum eu pulvinar rutrum, tellus ipsum laoreet sapien, quis venenatis ante odio sit amet eros. Proin magna. Duis vel nibh at velit scelerisque suscipit. Curabitur turpis. Vestibulum suscipit nulla quis orci. Fusce ac felis sit amet ligula pharetra condimentum. Maecenas egestas arcu quis ligula mattis placerat. Duis lobortis massa imperdiet quam. Suspendisse potenti. Pellentesque commodo eros a enim. Vestibulum turpis sem, aliquet eget, lobortis pellentesque, rutrum eu, nisl. Sed libero. Aliquam erat volutpat. Etiam vitae tortor. Morbi vestibulum volutpat enim. Aliquam eu nunc. Nunc sed turpis. Sed mollis, eros et ultrices tempus, mauris ipsum aliquam libero, non adipiscing dolor urna a orci. Nulla porta dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Pellentesque dapibus hendrerit tortor. Praesent egestas tristique nibh. Sed a libero. Cras varius. Donec vitae orci sed dolor rutrum auctor. Fusce egestas elit eget lorem. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam. Nam at tortor in tellus interdum sagittis. Aliquam lobortis. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla. Curabitur blandit mollis lacus. Nam adipiscing. Vestibulum eu odio. Vivamus laoreet. Nullam tincidunt adipiscing enim. Phasellus tempus. Proin viverra, ligula sit amet ultrices semper, ligula arcu tristique sapien, a accumsan nisi mauris ac eros. Fusce neque. Suspendisse faucibus, nunc et pellentesque egestas, lacus ante convallis tellus, vitae iaculis lacus elit id tortor. Vivamus aliquet elit ac nisl. Fusce fermentum odio nec arcu. Vivamus euismod mauris. In ut quam vitae odio lacinia tincidunt. Praesent ut ligula non mi varius sagittis. Cras sagittis. Praesent ac sem eget est egestas volutpat. Vivamus consectetuer hendrerit lacus. Cras non dolor. Vivamus in erat ut urna cursus vestibulum. Fusce commodo aliquam arcu. Nam commodo suscipit quam. Quisque id odio. Praesent venenatis metus at tortor pulvinar varius.")

fakeData["ru"]["lorem"] := array("Пешеходов надо любить. Пешеходы составляют большую часть человечества. Мало того – лучшую его часть. Пешеходы создали мир. Это они построили города, возвели многоэтажные здания, провели канализацию и водопровод, замостили улицы и осветили их электрическими лампами. Это они распространили культуру по всему свету, изобрели книгопечатание, выдумали порох, перебросили мосты через реки, расшифровали египетские иероглифы, ввели в употребление безопасную бритву, уничтожили торговлю рабами и установили, что из бобов сои можно изготовить 114  вкусных питательных блюд. И когда все было готово, когда родная планета приняла сравнительно благоустроенный вид, появились автомобилисты. Надо заметить, что автомобиль тоже был изобретен пешеходом. Но автомобилисты об этом как то сразу забыли. Кротких и умных пешеходов стали давить. Улицы, созданные пешеходами, перешли во власть автомобилистов. Мостовые стали вдвое шире, тротуары сузились до размера табачной бандероли. И пешеходы стали испуганно жаться к стенам домов. В большом городе пешеходы ведут мученическую жизнь. Для них ввели некое транспортное гетто. Им разрешают переходить улицы  только на перекрестках, то есть именно в тех местах, где движение сильнее всего и где волосок, на котором обычно висит жизнь пешехода, легче всего оборвать. В нашей обширной стране обыкновенный автомобиль, предназначенный, по мысли пешеходов, для мирной перевозки людей и грузов, принял грозные очертания братоубийственного снаряда. Он выводит из строя целые шеренги членов профсоюзов и их семей. Если пешеходу иной раз удается выпорхнуть из под серебряного носа машины живым, – его штрафует милиция за нарушение правил уличного катехизиса вообще авторитет пешеходов сильно пошатнулся. Они, давшие миру таких замечательных людей, как Гораций, Бойль Мариотт , Лобачевский и Гутенберг, они, выделившие из своей среды таких завзятых пешеходов, как Пушкин, Вольтер, Мейерхольд  и Анатоль Франс, – принуждены теперь кривляться самым пошлым образом, чтобы только напомнить о своем существовании. Боже, боже, которого, в сущности, нет! До  чего ты, которого на самом деле то и нет, довел пешехода! Вот идет он из Владивостока в Москву по сибирскому тракту, держа в одной руке знамя с надписью: «Перестроим быт текстильщиков» и перекинув через плечо палку, на конце которой болтаются резервные сандалии «Дядя Ваня» и жестяной чайник без крышки. Это советский пешеход физкультурник, который вышел из Владивостока юношей и на склоне лет у самых ворот Москвы будет задавлен тяжелым автокаром, номер которого так и не успеют заметить. Или другой, европейский могикан пешеходного движения. Он идет пешком вокруг света, катя перед собой бочку. Он пошел бы просто  так, без бочки, но тогда никто не заметит, что он действительно пешеход дальнего следования и про него ничего не напишут в газетах. Приходится всю жизнь толкать перед собой проклятую тару, на которой к тому же (позор, позор!) выведена большая желтая надпись, восхваляющая непревзойденные качества автомобильного масла «Грезы шофера». Так деградировал пешеход. И только в маленьких русских городах пешехода еще уважают и любят. Там он еще является хозяином улиц, беззаботно бродит по мостовой и пересекает ее самым замысловатым образом в любом направлении. Гражданин в фуражке с белым верхом, какую по большей части носят администраторы летних садов и конферансье, несомненно принадлежал к большей и лучшей части человечества. Он двигался по улицам города Арбатова пешком, со снисходительным любопытством озираясь по сторонам. В руке он держал небольшой акушерский саквояж. Город, видимо, ничем не поразил пешехода в артистической фуражке. Он увидел десятка полтора голубых, резедовых и бело розовых звонниц; бросилось ему в глаза облезлое кавказское  золото церковных куполов. Флаг клубничного цвета  трещал над официальным зданием. У белых башенных ворот провинциального кремля две суровые старухи разговаривали по французски, жаловались на советскую власть и вспоминали любимых дочерей. Из церковного подвала несло холодом, бил оттуда кислый винный запах. Там, как видно, хранился картофель. – Храм Спаса  на картошке, – негромко сказал пешеход. Пройдя под фанерной аркой со свежим известковым лозунгом: «Привет 5й окружной конференции женщин и девушек», он очутился у начала длинной аллеи, именовавшейся Бульваром Молодых Дарований. – Нет, – сказал он с огорчением, – это не Рио де Жанейро, это гораздо хуже. Почти на всех скамьях Бульвара Молодых Дарований сидели одинокие девицы с раскрытыми книжками в руках. Дырявые тени падали на страницы книг, на голые локти, на трогательные челки. Когда приезжий вступил в прохладную аллею, на скамьях произошло заметное движение. Девушки, прикрывшись книгами Гладкова, Элизы Ожешко и Сейфуллиной, бросали на приезжего трусливые взгляды. Он проследовал мимо взволнованных читательниц парадным шагом и вышел к зданию исполкома – цели своей прогулки. В эту минуту из за угла выехал извозчик. Рядом с ним, держась за пыльное обугленное  крыло экипажа и размахивая вздутой папкой с тисненой надписью «Musique», быстро шел человек в длиннополой толстовке. Он что то горячо доказывал седоку. Седок – пожилой мужчина с висячим, как банан, носом – сжимал ногами чемодан и время от времени показывал своему собеседнику кукиш. В пылу спора его инженерская фуражка, околыш которой сверкал зеленым диванным плюшем, покосилась набок. Обе тяжущиеся стороны часто и особенно громко произносили слово «оклад».", "Мифопоэтическое пространство взаимно. Талант Капниста по-настоящему раскрылся в комедии «Ябеда», здесь верлибр редуцирует ямб, первым образцом которого принято считать книгу А.Бертрана «Гаспар из тьмы». Метр аннигилирует контрапункт, об этом свидетельствуют краткость и завершенность формы, бессюжетность, своеобразие тематического развертывания. Эпическая медлительность неумеренно аннигилирует экзистенциальный дольник, тем не менее узус никак не предполагал здесь родительного падежа. Гекзаметр, несмотря на внешние воздействия, точно аннигилирует музыкальный жанр, однако дальнейшее развитие приемов декодирования мы находим в работах академика В.Виноградова. Первое полустишие диссонирует диссонансный дискурс, при этом нельзя говорить, что это явления собственно фоники, звукописи. Филиация вразнобой осознаёт эпизодический реципиент, однако дальнейшее развитие приемов декодирования мы находим в работах академика В.Виноградова. Стихотворение, чтобы уловить хореический ритм или аллитерацию на «л», приводит поток сознания и передается в этом стихотворении Донна метафорическим образом циркуля. Размер отталкивает литературный эпитет, именно поэтому голос автора романа не имеет никаких преимуществ перед голосами персонажей. Женское окончание вызывает диалектический характер, таким образом, очевидно, что в нашем языке царит дух карнавала, пародийного отстранения. Подтекст, по определению отражает лирический субъект, таким образом постепенно смыкается с сюжетом. Аллюзия вероятна. Жанр приводит эпизодический диалектический характер, об этом свидетельствуют краткость и завершенность формы, бессюжетность, своеобразие тематического развертывания. После того как тема сформулирована, речевой акт отражает пастиш, потому что в стихах и в прозе автор рассказывает нам об одном и том же. Гекзаметр, без использования формальных признаков поэзии, полидисперсен. Матрица выбирает музыкальный речевой акт, где автор является полновластным хозяином своих персонажей, а они - его марионетками.Уместно оговориться: подтекст полидисперсен. Холодный цинизм изменяем. Правило альтернанса абсурдно отражает стих и передается в этом стихотворении Донна метафорическим образом циркуля. Полифонический роман интегрирует дискурс, таким образом постепенно смыкается с сюжетом. Ударение, несмотря на внешние воздействия, абсурдно осознаёт дактиль, также необходимо сказать о сочетании метода апроприации художественных стилей прошлого с авангардистскими стратегиями. Силлабика непосредственно интегрирует жанр, но языковая игра не приводит к активно-диалогическому пониманию. Скрытый смысл прочно начинает прозаический акцент, но известны случаи прочитывания содержания приведённого отрывка иначе. Гекзаметр отражает гекзаметр, но не рифмами. Контрапункт дает эпизодический одиннадцатисложник, потому что сюжет и фабула различаются. Развивая эту тему, парафраз абсурдно отталкивает ритмический рисунок, потому что в стихах и в прозе автор рассказывает нам об одном и том же Аффилиация вероятна. Стихотворение фонетически интегрирует коммунальный модернизм, потому что в стихах и в прозе автор рассказывает нам об одном и том же. Развивая эту тему, линеаризация мышления абсурдно отталкивает культурный коммунальный модернизм, хотя в существование или актуальность этого он не верит, а моделирует собственную реальность. Стихотворение аллитерирует метр, но известны случаи прочитывания содержания приведённого отрывка иначе. Зачин, если уловить хореический ритм или аллитерацию на «р», притягивает деструктивный не-текст, таким образом, очевидно, что в нашем языке царит дух карнавала, пародийного отстранения. Мифопоэтическое пространство взаимно. Талант Капниста по-настоящему раскрылся в комедии «Ябеда», здесь верлибр редуцирует ямб, первым образцом которого принято считать книгу А.Бертрана «Гаспар из тьмы». Метр аннигилирует контрапункт, об этом свидетельствуют краткость и завершенность формы, бессюжетность, своеобразие тематического развертывания. Эпическая медлительность неумеренно аннигилирует экзистенциальный дольник, тем не менее узус никак не предполагал здесь родительного падежа. Гекзаметр, несмотря на внешние воздействия, точно аннигилирует музыкальный жанр, однако дальнейшее развитие приемов декодирования мы находим в работах академика В.Виноградова. Первое полустишие диссонирует диссонансный дискурс, при этом нельзя говорить, что это явления собственно фоники, звукописи. Филиация вразнобой осознаёт эпизодический реципиент, однако дальнейшее развитие приемов декодирования мы находим в работах академика В.Виноградова. Стихотворение, чтобы уловить хореический ритм или аллитерацию на «л», приводит поток сознания и передается в этом стихотворении Донна метафорическим образом циркуля. Размер отталкивает литературный эпитет, именно поэтому голос автора романа не имеет никаких преимуществ перед голосами персонажей. Женское окончание вызывает диалектический характер, таким образом, очевидно, что в нашем языке царит дух карнавала, пародийного отстранения. Подтекст, по определению отражает лирический субъект, таким образом постепенно смыкается с сюжетом. Аллюзия вероятна. Жанр приводит эпизодический диалектический характер, об этом свидетельствуют краткость и завершенность формы, бессюжетность, своеобразие тематического развертывания. После того как тема сформулирована, речевой акт отражает пастиш, потому что в стихах и в прозе автор рассказывает нам об одном и том же. Гекзаметр, без использования формальных признаков поэзии, полидисперсен. Матрица выбирает музыкальный речевой акт, где автор является полновластным хозяином своих персонажей, а они - его марионетками.Уместно оговориться: подтекст полидисперсен. Холодный цинизм изменяем. Правило альтернанса абсурдно отражает стих и передается в этом стихотворении Донна метафорическим образом циркуля. Полифонический роман интегрирует дискурс, таким образом постепенно смыкается с сюжетом. Ударение, несмотря на внешние воздействия, абсурдно осознаёт дактиль, также необходимо сказать о сочетании метода апроприации художественных стилей прошлого с авангардистскими стратегиями. Силлабика непосредственно интегрирует жанр, но языковая игра не приводит к активно-диалогическому пониманию. Скрытый смысл прочно начинает прозаический акцент, но известны случаи прочитывания содержания приведённого отрывка иначе. Гекзаметр отражает гекзаметр, но не рифмами. Контрапункт дает эпизодический одиннадцатисложник, потому что сюжет и фабула различаются. Развивая эту тему, парафраз абсурдно отталкивает ритмический рисунок, потому что в стихах и в прозе автор рассказывает нам об одном и том же Аффилиация вероятна. Стихотворение фонетически интегрирует коммунальный модернизм, потому что в стихах и в прозе автор рассказывает нам об одном и том же. Развивая эту тему, линеаризация мышления абсурдно отталкивает культурный коммунальный модернизм, хотя в существование или актуальность этого он не верит, а моделирует собственную реальность. Стихотворение аллитерирует метр, но известны случаи прочитывания содержания приведённого отрывка иначе. Зачин, если уловить хореический ритм или аллитерацию на «р», притягивает деструктивный не-текст, таким образом, очевидно, что в нашем языке царит дух карнавала, пародийного отстранения.")


;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ Lorem ipsum
getLorem(request){
    global lorem

	global lastResult := ""

    local := "en" ;current language
    if (!RegExMatch(request, getLocalsRE(), local)){
        local := "en"
    }

    lorem := fakeData[local]

    maxLeNumber := lorem.MaxIndex()

    Random, leNumber, 1, %maxLeNumber% ;number to be used as lorem version. 
    
	reqlen := StrLen(request)
	clear(reqlen + 2)

	backupClipboard()

	if (RegExMatch(request, "w[ ]?[0-9]+", words)){
		;output lorem by words
		words := substr(words, 2, strlen(words)) + 0
		;SendInput %words% words of lorem
		res := ""
		wCounter := 0
        src := lorem[leNumber]
		Loop, Parse, src, " "
		{
			res .= A_LoopField . " "
			wCounter ++
			if (wCounter >= words){
				res := substr(res, 1, -1)
				res .= "."
				Break
			}
		}
		clipboard = %res%
		Send ^v
		;lastResult := res

	} else if (RegExMatch(request, "s[ ]?[0-9]+", sents)){
		;output lorem by sentences
		sents := substr(sents, 2, strlen(sents)) + 0
		;SendInput %sents% sentences of lorem
		res := ""
		sCounter := 0
        src := lorem[leNumber]
		Loop, Parse, src, "."
		{
			res .= A_LoopField . "."
			sCounter ++
			if (sCounter >= sents || sCounter >= 100) {
				Break
			}
		}
		clipboard = %res%
		Send ^v
		;lastResult := res

	} else if (RegExMatch(request, "p[ ]?[0-9]+", pars)){
		;output lorem by paragraphs
		pars := substr(pars, 2, strlen(pars)) + 0
		;SendInput %pars% paragraphs of lorem
		res := ""
		pCounter := 0
		sCounter := 0
		Random, sNumber, 6, 12 ;number of sentences in section
        src := lorem[leNumber]
		Loop, Parse, src, "."
		{	
			sCounter ++
			if (sCounter >= sNumber) {
				sCounter := 0
				pCounter ++
				Random, sNumber, 6, 12
				res .= "`n"
			}
			if (pCounter >= pars || pCounter >= 100) {
				Break
			}
			res .= A_LoopField . "."
		}
		clipboard = %res%
		Send ^v
		;lastResult := res 

	} else {
		RegExMatch(request, "[0-9]+", chars)
		if (!chars) {
			chars := 600
		}
		;output lorem by chars
        src := lorem[leNumber]
		res := Substr(src, 1, chars)
		Clipboard = %res%
		Send ^v
		;SendInput %chars% chars of lorem
		;lastResult := res
	}


    ;selectBefore(strlen(res))

	restoreClipboard()

	return true
}


;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ ADDRESS

fakeData["ru"]["cityPrefix"] := array("город")
fakeData["en"]["cityPrefix"] := array("North", "East", "West", "South", "New", "Lake", "Port")

fakeData["en"]["citySuffix"] := array("town", "ton", "land", "ville", "berg", "burgh", "borough", "bury", "view", "port", "mouth", "stad", "furt", "chester", "mouth", "fort", "haven", "side", "shire")

fakeData["ru"]["regionSuffix"] := array("область")

fakeData["ru"]["streetPrefix"] := array("пер.", "ул.", "пр.", "шоссе", "пл.", "бульвар","въезд", "спуск", "проезд", "наб.")

fakeData["en"]["streetSuffix"] := array( "Alley","Avenue","Branch","Bridge","Brook","Brooks","Burg","Burgs","Bypass","Camp","Canyon","Cape","Causeway","Center","Centers","Circle","Circles","Cliff","Cliffs","Club","Common","Corner","Corners","Course","Court","Courts","Cove","Coves","Creek","Crescent","Crest","Crossing","Crossroad","Curve","Dale","Dam","Divide","Drive","Drive","Drives","Estate","Estates","Expressway","Extension","Extensions","Fall","Falls","Ferry","Field","Fields","Flat","Flats","Ford","Fords","Forest","Forge","Forges","Fork","Forks","Fort","Garden","Gardens","Gateway","Glen","Glens","Green","Greens","Grove","Groves","Harbour","Harbours","Haven","Heights","Highway","Hill","Hills","Hollow","Inlet", "Island","Islands", "Isle","Junction","Junctions","Key","Keys","Knoll","Knolls","Lake","Lakes","Land","Landing","Lane","Light","Lights","Loaf","Lock","Locks","Locks","Lodge","Lodge","Loop","Manor","Manors","Meadow","Meadows","Mews","Mill","Mills","Motorway","Mount","Mountain","Mountains","Neck","Orchard","Oval","Overpass","Park","Parks","Parkway","Parkways","Pass","Passage","Path","Pike","Pine","Pines","Place","Plain","Plains","Plaza","Point","Points","Port","Ports","Radial","Ramp","Ranch","Rapid","Rapids","Rest","Ridge","Ridges","River","Road","Road","Roads","Roads","Route","Row","Rue","Run","Shoal","Shoals","Shore","Shores","Spring","Springs","Springs","Spur","Spurs","Square","Square","Squares","Squares","Station","Station","Stream","Stream","Street","Streets","Summit","Terrace","Throughway","Trace","Track","Trafficway","Trail","Tunnel","Turnpike","Underpass","Union","Unions","Valley","Valleys","Via","Viaduct","View","Views","Village","Villages","Ville","Vista","Vista","Walk","Walks","Wall","Way","Ways","Well","Wells")

fakeData["ru"]["country"] := array("Украина", "Российская Федерация", "США", "Канада", "Австралия", "Австрия", "Азербайджан", "Аландские острова", "Албания", "Алжир", "Американские острова Самоа", "Ангилья","Ангола", "Андорра", "Антарктика", "Антигуа и Барбуда", "Аргентина", "Армения","Аруба", "Афганистан, Исламская Республика", "Багамы", "Бангладеш", "Барбадос", "Бахрейн",        "Белиз", "Белоруссия", "Бельгия", "Бермудские Острова", "Болгария", "Боливия","Босния и Герцеговина", "Ботсвана", "Бразилия", "Британская территория Индийского океана","Бруней Даруссалам", "Буркина Фасо", "Бурунди", "Бутан", "Вануату","Великобритания", "Венгрия", "Венесуэла", "Виргинские о-ва, Великобритания", "Виргинские о-ва, США","Восточный Тимор", "Вьетнам", "Габон", "Гаити", "Гайана","Гамбия", "Гана", "Гваделупа", "Гватемала", "Гвинея","Гвинея-Биссау", "Германия", "Гибралтар", "Гонгконг", "Гондурас","Государство-город Ватикан", "Гренада", "Гренландия", "Греция", "Грузия","Гуам", "Дания", "Джерси", "Джибути", "Доминиканская Республика","Египет", "Замбия", "Западная Сахара", "Зимбабве", "Израиль","Индия", "Индонезия", "Иордания", "Ирак", "Иран","Ирландия", "Исландия", "Испания", "Италия", "Йемен","Казахстан, Республика", "Каймановы Острова", "Камбоджа", "Камерун", "Катар","Кения", "Кипр", "Кирибати", "Китай", "Кокосовые острова","Колумбия", "Коморские Острова", "Конго, Демократическая Республика", "Конго, Республика", "Коста-Рика","Кот-д’Ивуар", "Куба", "Кувейт", "Кыргызстан", "Лаос","Латвия", "Лесото", "Либерия", "Ливан", "Ливия","Литва", "Лихтенштейн", "Люксембург", "Маврикий", "Мавритания","Мадагаскар, Республика", "Майотта", "Макао", "Македония, Республика", "Малави","Малайзия", "Мали", "Мальдивы", "Мальта", "Марокко","Мартиник", "Маршалловы Острова", "Мексика", "Мелкие отдаленные острова США", "Мозамбик","Молдова", "Монако", "Монголия", "Монтсеррат", "Мьянма","Намибия", "Науру", "Непал", "Нигерия", "Нигерия","Нидерландские Антильские острова", "Нидерланды", "Никарагуа", "Ниуэ", "Новая Зеландия","Новая Каледония", "Норвегия", "Объединённые Арабские Эмираты", "О. Гернси", "Оман","Острова Зеленого Мыса", "Острова Кука", "Острова Теркс И Кайкос", "Острова Уоллис и Футуна", "Острова Херд и Макдональд","Остров Буве", "Остров Доминика", "Остров Мэн", "Остров Норфолк", "Остров Святого Мартина","Остров Святой Елены", "О. Южная Георгия И Южные Сандвичевы Острова", "Пакистан", "Палау", "Палестина","Панама", "Папуа-Новая Гвинея", "Парагвай", "Перу", "Питкерн", "Польша", "Португалия", "Пуэрто-Рико", "Реюньон", "Рождественские острова","Руанда", "Румыния", "Сальвадор", "Самоа", "Сан-Марино","Сан-Томе и Принсипи", "Саудовская Аравия", "Свазиленд", "Северная Корея", "Северные Марианские Острова","Сейшельские Острова", "Сен-Бартельми", "Сенегал", "Сен-Пьер и Микелон", "Сент-Винсент и Гренадины","Сент-Киттс и Невис", "Сент-Люсия", "Сербия", "Сербия и Черногория, Государственный Союз", "Сингапур","Сирия", "Словацкая республика", "Словения", "Соломонские острова", "Сомали","Судан", "Суринам", "Сьерра-Леоне", "Таджикистан", "Тайвань","Тайланд", "Танзания", "Того", "Токелау", "Тонга","Тринидад и Тобаго", "Тувалу", "Тунис", "Туркмения", "Турция","Уганда", "Узбекистан", "Уругвай", "Фарерские острова", "Федеративные Штаты Микронезии","Фиджи", "Филиппины", "Финляндия", "Фолклендские о-ва", "Франция","Французская Гвинея", "Французская Полинезия", "Французские Южные Территории", "Хорватия", "Чад","Черногория", "Чешская Республика", "Чили", "Швейцария", "Швеция","Шпицберген и Ян-Майен", "Шри-Ланка", "Эквадор", "Экваториальная Гвинея", "Эритрея","Эстония", "Эфиопия", "Южная Корея", "Южно-Африканская Республика", "Ямайка", "Япония")

fakeData["en"]["country"] := array("Afghanistan","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica (the territory South of 60 deg S)","Antigua and Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia and Herzegovina","Botswana","Bouvet Island (Bouvetoya)","Brazil","British Indian Ocean Territory (Chagos Archipelago)","British Virgin Islands","Brunei Darussalam","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central African Republic","Chad","Chile","China","Christmas Island","Cocos (Keeling)Islands", "Colombia", "Comoros","Congo","Congo","Cook Islands","Costa Rica","Cote d'Ivoire","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Faroe Islands","Falkland Islands (Malvinas)","Fiji","Finland","France","French Guiana","French Polynesia","French Southern Territories","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guernsey","Guinea","Guinea-Bissau","Guyana","Haiti","Heard Island and McDonald Islands","Holy See (Vatican City State)","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Korea","Korea","Kuwait","Kyrgyz Republic","Lao People's Democratic Republic","Latvia","Lebanon","Lesotho","Liberia","Libyan Arab Jamahiriya","Liechtenstein","Lithuania","Luxembourg","Macao","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal","Netherlands Antilles","Netherlands","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Niue","Norfolk Island","Northern Mariana Islands","Norway","Oman","Pakistan","Palau","Palestinian Territory","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Pitcairn Islands","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russian Federation","Rwanda","Saint Barthelemy","Saint Helena","Saint Kitts and Nevis","Saint Lucia","Saint Martin","Saint Pierre and Miquelon","Saint Vincent and the Grenadines","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia (Slovak Republic)","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and the South Sandwich Islands","Spain","Sri Lanka","Sudan","Suriname","Svalbard & Jan Mayen Islands","Swaziland","Sweden","Switzerland","Syrian Arab Republic","Taiwan","Tajikistan","Tanzania","Thailand","Timor-Leste","Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States of America","United States Minor Outlying Islands","United States Virgin Islands","Uruguay","Uzbekistan","Vanuatu","Venezuela","Vietnam","Wallis and Futuna","Western Sahara","Yemen","Zambia","Zimbabwe")

fakeData["ru"]["postcode"] := array("#####")
fakeData["en"]["postcode"] := array("?# #??", "?## #??", "??# #??", "??## #??", "?#? #??", "??#? #??")

fakeData["ru"]["region"] := array("Амурская", "Архангельская", "Астраханская", "Белгородская", "Брянская","Владимирская", "Волгоградская", "Вологодская", "Воронежская", "Ивановская","Иркутская", "Калининградская", "Калужская", "Кемеровская", "Кировская","Костромская", "Курганская", "Курская", "Ленинградская", "Липецкая","Магаданская", "Московская", "Мурманская", "Нижегородская", "Новгородская","Новосибирская", "Омская", "Оренбургская", "Орловская", "Пензенская","Псковская", "Ростовская", "Рязанская", "Самарская", "Саратовская","Сахалинская", "Свердловская", "Смоленская", "Тамбовская", "Тверская","Томская", "Тульская", "Тюменская", "Ульяновская", "Челябинская","Читинская", "Ярославская")

fakeData["ru"]["city"] := array("Балашиха", "Видное", "Волоколамск", "Воскресенск", "Дмитров","Домодедово", "Дорохово", "Егорьевск", "Зарайск", "Истра","Кашира", "Клин", "Коломна", "Красногорск", "Лотошино","Луховицы", "Люберцы", "Можайск", "Москва", "Мытищи","Наро-Фоминск", "Ногинск", "Одинцово", "Озёры", "Орехово-Зуево","Павловский Посад", "Подольск", "Пушкино", "Раменское", "Сергиев Посад","Серебряные Пруды", "Серпухов", "Солнечногорск", "Ступино", "Талдом","Чехов", "Шатура", "Шаховская", "Щёлково")

fakeData["ru"]["county"] := array("Aberdeenshire", "Anglesey", "Angus", "Argyll", "Ayrshire", "Banffshire", "Bedfordshire", "Berwickshire", "Breconshire", "Buckinghamshire", "Bute", "Caernarvonshire", "Caithness", "Cambridgeshire", "Cardiganshire", "Carmarthenshire", "Cheshire", "Clackmannanshire", "Cornwall", "Isles of Scilly", "Cumbria", "Denbighshire", "Derbyshire", "Devon", "Dorset", "Dumbartonshire", "Dumfriesshire", "Durham", "East Lothian", "East Sussex", "Essex", "Fife", "Flintshire", "Glamorgan", "Gloucestershire", "Greater London", "Greater Manchester", "Hampshire", "Hertfordshire", "Inverness", "Kent", "Kincardineshire", "Kinross-shire", "Kirkcudbrightshire", "Lanarkshire", "Lancashire", "Leicestershire", "Lincolnshire", "London", "Merionethshire", "Merseyside", "Midlothian", "Monmouthshire", "Montgomeryshire", "Moray", "Nairnshire", "Norfolk", "North Yorkshire", "Northamptonshire", "Northumberland", "Nottinghamshire", "Orkney", "Oxfordshire", "Peebleshire", "Pembrokeshire", "Perthshire", "Radnorshire", "Renfrewshire", "Ross & Cromarty", "Roxburghshire", "Selkirkshire", "Shetland", "Shropshire", "Somerset", "South Yorkshire", "Staffordshire", "Stirlingshire", "Suffolk", "Surrey", "Sutherland", "Tyne and Wear", "Warwickshire", "West Lothian", "West Midlands", "West Sussex", "West Yorkshire", "Wigtownshire", "Wiltshire", "Worcestershire")


fakeData["ru"]["street"] := array("Косиора", "Ладыгина", "Ленина", "Ломоносова", "Сталина", "Московского", "Маяковского", "Бродвей")

fakeData["ru"]["addressFormats"] := array("{{postcode}}, {{region}} {{regionSuffix}}, {{cityPrefix}} {{city}}, {{streetPrefix}} {{street}}, {{buildingNumber}}")

fakeData["en"]["addressFormats"] := array("{{streetAddress}}\n{{city}}\n{{postcode}}")

fakeData["en"]["cityFormats"] := array("{{cityPrefix}} {{firstName}}{{citySuffix}}","{{cityPrefix}} {{firstName}}","{{firstName}}{{citySuffix}}","{{lastName}}{{citySuffix}}")

fakeData["ru"]["streetNameFormats"] := array("{{firstName}} {{streetSuffix}}","{{lastName}} {{streetSuffix}}")

fakeData["ru"]["streetAddressFormats"] := array("{{buildingNumber}} {{streetName}}","{{buildingNumber}} {{streetName}}","{{secondaryAddress}}\n{{streetName}}")

fakeData["ru"]["phoneFormats"] := array("(812) ###-##-##","(495) ###-####","+7 (922) ###-####","(35222) ##-####","8-800-###-####")
fakeData["en"]["phoneFormats"] := array("+44(0)##########","+44(0)#### ######","+44(0)#########","+44(0)#### #####","0##########","0#########","0#### ######","0#### #####","(0####) ######","(0####) #####",)

fakeData["en"]["emailDomain"] := array("gmail.com", "yahoo.com", "hotmail.com", "gmail.co.uk", "yahoo.co.uk", "hotmail.co.uk")
fakeData["en"]["domain"] = array("com", "com", "com", "com", "com", "com", "biz", "info", "net", "org", "co.uk");

fakeData["ru"]["domain"] := array("com", "com", "net", "org", "ru", "ru", "ru", "ru");


;---------------Ru person
fakeData["ru"]["firstName"] := array(
        'Александр', 'Алексей', 'Дмитрий', 'Сергей', 'Андрей', 'Антон', 'Артём',
        'Артемий', 'Виталий', 'Владимир', 'Денис', 'Евгений', 'Иван', 'Игорь',
        'Константин', 'Максим', 'Михаил', 'Николай', 'Павел', 'Роман', 'Станислав',
        'Август', 'Адам', 'Адриан', 'Аким', 'Ананий', 'Анатолий', 'Антонин',
        'Аполлон', 'Аркадий', 'Арсений', 'Богдан', 'Болеслав', 'Борис', 'Бронислав',
        'Вадим', 'Валентин', 'Валериан', 'Валерий', 'Василий', 'Вениамин', 'Виктор',
        'Викентий', 'Виль', 'Витольд', 'Владислав', 'Владлен', 'Всеволод', 'Вячеслав',
        'Геннадий', 'Георгий', 'Герасим', 'Герман', 'Глеб', 'Гордей', 'Григорий',
        'Давид', 'Дан', 'Даниил', 'Данила', 'Добрыня', 'Донат', 'Егор', 'Ефим',
        'Захар', 'Игнатий', 'Игнат', 'Илларион', 'Илья', 'Иннокентий', 'Иосиф',
        'Ираклий', 'Кирилл', 'Клим', 'Кузьма', 'Лаврентий', 'Лев', 'Леонид', 'Макар',
        'Марк', 'Матвей', 'Милан', 'Мирослав', 'Назар', 'Никита', 'Никодим',
        'Олег', 'Пётр', 'Платон', 'Прохор', 'Радислав', 'Рафаил', 'Родион',
        'Ростислав', 'Руслан', 'Савва', 'Сава', 'Святослав', 'Семён', 'Степан',
        'Стефан', 'Тарас', 'Тимофей', 'Тит', 'Фёдор', 'Феликс', 'Филипп', 'Юлиан',
        'Юлий', 'Юрий', 'Яков', 'Ян', 'Ярослав',
    );
fakeData["ru"]["midName"] := array(
        'Александрович', 'Алексеевич', 'Андреевич', 'Дмитриевич', 'Евгеньевич',
        'Сергеевич', 'Иванович', 'Фёдорович', 'Львович', 
    );
fakeData["ru"]["lastName"] := array(
        'Смирнов', 'Иванов', 'Кузнецов', 'Соколов', 'Попов', 'Лебедев', 'Козлов',
        'Новиков', 'Морозов', 'Петров', 'Волков', 'Соловьёв', 'Васильев', 'Зайцев',
        'Павлов', 'Семёнов', 'Голубев', 'Виноградов', 'Богданов', 'Воробьёв',
        'Фёдоров', 'Михайлов', 'Беляев', 'Тарасов', 'Белов', 'Комаров', 'Орлов',
        'Киселёв', 'Макаров', 'Андреев', 'Ковалёв', 'Ильин', 'Гусев', 'Титов',
        'Кузьмин', 'Кудрявцев', 'Баранов', 'Куликов', 'Алексеев', 'Степанов',
        'Яковлев', 'Сорокин', 'Сергеев', 'Романов', 'Захаров', 'Борисов', 'Королёв',
        'Герасимов', 'Пономарёв', 'Григорьев', 'Лазарев', 'Медведев', 'Ершов',
        'Никитин', 'Соболев', 'Рябов', 'Поляков', 'Цветков', 'Данилов', 'Жуков',
        'Фролов', 'Журавлёв', 'Николаев', 'Крылов', 'Максимов', 'Сидоров', 'Осипов',
        'Белоусов', 'Федотов', 'Дорофеев', 'Егоров', 'Матвеев', 'Бобров', 'Дмитриев',
        'Калинин', 'Анисимов', 'Петухов', 'Антонов', 'Тимофеев', 'Никифоров',
        'Веселов', 'Филиппов', 'Марков', 'Большаков', 'Суханов', 'Миронов', 'Ширяев',
        'Александров', 'Коновалов', 'Шестаков', 'Казаков', 'Ефимов', 'Денисов',
        'Громов', 'Фомин', 'Давыдов', 'Мельников', 'Щербаков', 'Блинов', 'Колесников',
        'Карпов', 'Афанасьев', 'Власов', 'Маслов', 'Исаков', 'Тихонов', 'Аксёнов',
        'Гаврилов', 'Родионов', 'Котов', 'Горбунов', 'Кудряшов', 'Быков', 'Зуев',
        'Третьяков', 'Савельев', 'Панов', 'Рыбаков', 'Суворов', 'Абрамов', 'Воронов',
        'Мухин', 'Архипов', 'Трофимов', 'Мартынов', 'Емельянов', 'Горшков', 'Чернов',
        'Овчинников', 'Селезнёв', 'Панфилов', 'Копылов', 'Михеев', 'Галкин', 'Назаров',
        'Лобанов', 'Лукин', 'Беляков', 'Потапов', 'Некрасов', 'Хохлов', 'Жданов',
        'Наумов', 'Шилов', 'Воронцов', 'Ермаков', 'Дроздов', 'Игнатьев', 'Савин',
        'Логинов', 'Сафонов', 'Капустин', 'Кириллов', 'Моисеев', 'Елисеев', 'Кошелев',
        'Костин', 'Горбачёв', 'Орехов', 'Ефремов', 'Исаев', 'Евдокимов', 'Калашников',
        'Кабанов', 'Носков', 'Юдин', 'Кулагин', 'Лапин', 'Прохоров', 'Нестеров',
        'Харитонов', 'Агафонов', 'Муравьёв', 'Ларионов', 'Федосеев', 'Зимин', 'Пахомов',
        'Шубин', 'Игнатов', 'Филатов', 'Крюков', 'Рогов', 'Кулаков', 'Терентьев',
        'Молчанов', 'Владимиров', 'Артемьев', 'Гурьев', 'Зиновьев', 'Гришин', 'Кононов',
        'Дементьев', 'Ситников', 'Симонов', 'Мишин', 'Фадеев', 'Комиссаров', 'Мамонтов',
        'Носов', 'Гуляев', 'Шаров', 'Устинов', 'Вишняков', 'Евсеев', 'Лаврентьев',
        'Брагин', 'Константинов', 'Корнилов', 'Авдеев', 'Зыков', 'Бирюков', 'Шарапов',
        'Никонов', 'Щукин', 'Дьячков', 'Одинцов', 'Сазонов', 'Якушев', 'Красильников',
        'Гордеев', 'Самойлов', 'Князев', 'Беспалов', 'Уваров', 'Шашков', 'Бобылёв',
        'Доронин', 'Белозёров', 'Рожков', 'Самсонов', 'Мясников', 'Лихачёв', 'Буров',
        'Сысоев', 'Фомичёв', 'Русаков', 'Стрелков', 'Гущин', 'Тетерин', 'Колобов',
        'Субботин', 'Фокин', 'Блохин', 'Селиверстов', 'Пестов', 'Кондратьев', 'Силин',
        'Меркушев', 'Лыткин', 'Туров',
    );



buildingNumber()
    {
        maxBuilding := 180
        Random, num, 1, %maxBuilding%
        return num
    }

getAddress(req){
    global lorem
    global lastResult := ""

    local := "en" ;current language
    if (!RegExMatch(request, getLocalsRE(), local)){
        local := "en"
    }

    maxNumber := address[local].MaxIndex()

    Random, leNumber, 1, %maxNumber% ;number to be used as lorem version. 
    
    reqlen := StrLen(request)
    clear(reqlen + 2)

    backupClipboard()



    restoreClipboard()
    return true
}







;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ NAME
getName(req){
    global lorem
    global lastResult := ""

    local := "en" ;current language
    if (!RegExMatch(request, getLocalsRE(), local)){
        local := "en"
    }

    maxNumber := name[local].MaxIndex()

    Random, leNumber, 1, %maxNumber% ;number to be used as lorem version. 
    
    reqlen := StrLen(request)
    clear(reqlen + 2)

    backupClipboard()



    restoreClipboard()
    return true
}



;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ PHONE
getPhone(req){
    global lorem
    global lastResult := ""

    local := "en" ;current language
    if (!RegExMatch(request, getLocalsRE(), local)){
        local := "en"
    }

    maxNumber := phone[local].MaxIndex()

    Random, leNumber, 1, %maxNumber% ;number to be used as lorem version. 
    
    reqlen := StrLen(request)
    clear(reqlen + 2)

    backupClipboard()



    restoreClipboard()
    return true
}



;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ MAIL
getMail(req){
    global lorem
    global lastResult := ""

    local := "en" ;current language
    if (!RegExMatch(request, getLocalsRE(), local)){
        local := "en"
    }

    maxNumber := mail[local].MaxIndex()

    Random, leNumber, 1, %maxNumber% ;number to be used as lorem version. 
    
    reqlen := StrLen(request)
    clear(reqlen + 2)

    backupClipboard()



    restoreClipboard()
    return true
}





;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ DATETIME
getDate(req){
    global lorem
    global lastResult := ""

    local := "en" ;current language
    if (!RegExMatch(request, getLocalsRE(), local)){
        local := "en"
    }

    maxNumber := date[local].MaxIndex()

    Random, leNumber, 1, %maxNumber% ;number to be used as lorem version. 
    
    reqlen := StrLen(request)
    clear(reqlen + 2)

    backupClipboard()



    restoreClipboard()
    return true
}
getTime(req){
    global lorem
    global lastResult := ""

    local := "en" ;current language
    if (!RegExMatch(request, getLocalsRE(), local)){
        local := "en"
    }

    maxNumber := time[local].MaxIndex()

    Random, leNumber, 1, %maxNumber% ;number to be used as lorem version. 
    
    reqlen := StrLen(request)
    clear(reqlen + 2)

    backupClipboard()



    restoreClipboard()
    return true
}