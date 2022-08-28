import 'package:json_annotation/json_annotation.dart';

part 'speaker.g.dart';

@JsonSerializable()
class Speaker {
  String name;
  String subtitle;
  String imageUrl;
  String? twitter;
  String? linkedIn;

  Speaker({
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    this.twitter,
    this.linkedIn,
  });

  Speaker.mikeRydstrom()
      : this(
          name: 'Mike Rydstrom',
          subtitle: 'Deep dive into theming',
          imageUrl:
              'https://sessionize.com/image/fe2e-400o400o2-BussxdPqDUQnzNHKAEFmmv.jpg',
          twitter: 'https://twitter.com/RydMike',
          linkedIn: 'https://www.linkedin.com/in/mike-r-83934546/',
        );
  Speaker.roaaKhaddam()
      : this(
          name: 'Roaa Khaddam',
          subtitle: 'Senior Flutter Developer',
          imageUrl:
              'https://sessionize.com/image/2f41-400o400o2-NTpZDEWFQh3w3J2Smc9GhW.png',
          twitter: 'https://twitter.com/roaakdm',
          linkedIn: 'https://www.linkedin.com/in/roaa-kh/',
        );
  Speaker.alicjaOgonowska()
      : this(
          name: 'Alicja Ogonowska',
          subtitle: 'Flutter Developer at EQUIQO',
          imageUrl:
              'https://sessionize.com/image/ae0e-400o400o2-GqHtuwj5qxJiu8WrV6LzJe.jpg',
          linkedIn: 'https://www.linkedin.com/in/alicja-ogonowska/',
        );
  Speaker.annaLeushchenko()
      : this(
          name: 'Anna Leushchenko',
          subtitle:
              'Mobile development expert, passionate about quality software, focused on Flutter. Google Developer Expert in Dart and Flutter.',
          imageUrl:
              'https://sessionize.com/image/b7ce-400o400o2-P5jZpWndBet3pSvm9LqsvM.png',
          twitter: 'https://twitter.com/AnnaLeushchenko',
          linkedIn: 'https://www.linkedin.com/in/annaleushchenko/',
        );
  Speaker.alessioSalvadorini()
      : this(
          name: 'Alessio Salvadorini',
          subtitle:
              'Team Lead at Signant Health during the day, Explorer at Fluxit during the night',
          imageUrl:
              'https://sessionize.com/image/2610-400o400o2-nwXbDXGdYeyP6JnZ9y4QS8.jpg',
          twitter: 'https://twitter.com/ASalvadorini',
          linkedIn: 'https://www.linkedin.com/in/alessiosalvadorini/',
        );
  Speaker.chrisSwan()
      : this(
          name: 'Chris Swan',
          subtitle: 'Engineer, The @ Company',
          imageUrl:
              'https://sessionize.com/image/a4ad-400o400o2-EePHQjgxzX6isKBC3vZAfh.jpg',
          twitter: 'https://twitter.com/cpswan',
          linkedIn: 'https://www.linkedin.com/in/chrisswan/',
        );
  Speaker.craigLabenz()
      : this(
          name: 'Craig Labenz',
          subtitle: 'Flutter Developer Relations Engineer',
          imageUrl:
              'https://sessionize.com/image/7fdd-400o400o2-MwWRAafFzkXKYqocgYnmo7.jpg',
          twitter: 'https://twitter.com/craig_labenz',
        );

  Speaker.poojaBhaumik()
      : this(
          name: 'Pooja Bhaumik',
          subtitle:
              'Sr. Engineer at Uni Cards | Google Developer Expert (Flutter)',
          imageUrl:
              'https://sessionize.com/image/8a7f-400o400o2-Kau4P6PVQJ9vkJ3eRjEJ8r.jpg',
          twitter: 'https://twitter.com/pooja_bhaumik',
          linkedIn: 'https://www.linkedin.com/in/poojab26/',
        );
  Speaker.salihGuler()
      : this(
          name: 'Salih Guler',
          subtitle: 'Senior Developer Advocate at AWS Amplify',
          imageUrl:
              'https://sessionize.com/image/61e7-400o400o2-6f-529c-48fd-ba12-94903187a216.0b218d7f-e945-4468-92f7-a4fa30127168.png',
          twitter: 'https://twitter.com/salihgueler',
          linkedIn: 'https://www.linkedin.com/in/msalihguler/',
        );

  Speaker.akankshaSingh()
      : this(
          name: 'Akanksha Singh',
          subtitle: 'Flutter Dev | SWE Intern at JP Morgan Chase & Co.',
          imageUrl:
              'https://sessionize.com/image/b9d3-400o400o2-VEUvBY1PdZGsovLGSarYc8.jpg',
          twitter: 'https://twitter.com/coder_jedi',
          linkedIn: 'https://www.linkedin.com/in/akanksha1212/',
        );

  Speaker.christianBuddeChristensen()
      : this(
          name: 'Christian Budde Christensen',
          subtitle:
              'Maintainer of graphql, graphql_flutter, and graphql_codegen',
          imageUrl:
              'https://sessionize.com/image/e941-400o400o2-WzyqMovWHEiHBbHX7HUamS.jpeg',
          linkedIn: 'https://www.linkedin.com/in/budde377/',
        );

  Speaker.guillaumeDialloMulliez()
      : this(
          name: 'Guillaume Diallo-Mulliez',
          subtitle: 'Head of Flutter Engineering - BAM',
          imageUrl:
              'https://sessionize.com/image/048a-400o400o2-SYEHEKiJUqrxRGj5tYc5db.jpg',
          twitter: 'https://twitter.com/Guitoof',
          linkedIn: 'https://www.linkedin.com/in/guillaumediallomulliez/',
        );

  Speaker.dominikRoszkowski()
      : this(
          name: 'Dominik Roszkowski',
          subtitle: 'Google Developer Expert in Flutter',
          imageUrl:
              'https://sessionize.com/image/e4ca-400o400o2-7LE3qgbEPMFTHmNSaFiDGh.jpg',
          twitter: 'https://twitter.com/OrestesGaolin',
          linkedIn: 'https://www.linkedin.com/in/dominik-roszkowski/',
        );
  Speaker.remiRousselet()
      : this(
          name: 'Remi Rousselet',
          subtitle: 'Open-source software engineer at Invertase',
          imageUrl:
              'https://sessionize.com/image/d803-400o400o2-Vsdu82sKyjE1fNStNjejdv.png',
          twitter: 'https://twitter.com/remi_rousselet',
          linkedIn: 'https://www.linkedin.com/in/r%C3%A9mi-rousselet/',
        );
  Speaker.nilsReichardt()
      : this(
          name: 'Nils Reichardt',
          subtitle: 'Co-Founder of Sharezone',
          imageUrl:
              'https://sessionize.com/image/f1e4-400o400o2-Xt7bcM6BkxfLYPBhVxR9yG.png',
          twitter: 'https://twitter.com/nilsreichardt',
          linkedIn: 'https://linkedin.com/in/nilsreichardt',
        );
  Speaker.abhishekDoshi()
      : this(
          name: 'Abhishek Doshi',
          subtitle:
              'Google Developer Expert - Dart & Flutter, Sr. Flutter Engineer',
          imageUrl:
              'https://sessionize.com/image/4b6d-400o400o2-hY2vZT9MD12xhv9fbiu8Jf.png',
          twitter: 'https://twitter.com/AbhishekDoshi26',
          linkedIn: 'https://www.linkedin.com/in/abhishekdoshi26/',
        );

  Speaker.mateuszWojtczak()
      : this(
          name: 'Mateusz Wojtczak',
          subtitle:
              'Mobile Team Leader @ LeanCode Flutter Software Studio from Warsaw',
          imageUrl:
              'https://sessionize.com/image/e5b7-400o400o2-N9xMesEvaTmZJRZjnEHNzH.jpg',
          twitter: 'https://twitter.com/matiwojt',
          linkedIn: 'https://www.linkedin.com/in/mateusz-wojtczak-02bb58210/',
        );
  Speaker.albertWolszon()
      : this(
          name: 'Albert Wolszon',
          subtitle:
              'Flutter Developer @ LeanCode Flutter Software Studio from Warsaw',
          imageUrl:
              'https://sessionize.com/image/0e16-400o400o2-4qs5VzyEMYJwTqLPoLGJtc.jpg',
          twitter: 'https://twitter.com/albert_wolszon',
          linkedIn: 'https://www.linkedin.com/in/albertwolszon/',
        );

  Speaker.devenJoshi()
      : this(
          name: 'Deven Joshi',
          subtitle: 'Developer Advocate, Stream',
          imageUrl:
              'https://sessionize.com/image/5eff-400o400o2-NssZjaXW1UrAv9HP5vXJzV.jpg',
          twitter: 'https://twitter.com/DevenJoshi7',
        );
  Speaker.gordonHayes()
      : this(
          name: 'Gordon Hayes',
          subtitle: 'DevRel Advocacy Manager at Stream',
          imageUrl:
              'https://sessionize.com/image/0387-400o400o2-9e33b4ed-08a6-43b6-b0c7-fe7028491054.jpg',
          twitter: 'https://twitter.com/gordonphayes',
          linkedIn: 'https://www.linkedin.com/in/gordon-hayes-05274899/',
        );
  Speaker.renanAraujo()
      : this(
          name: 'Renan Araujo',
          subtitle: 'Flutter engineer',
          imageUrl:
              'https://sessionize.com/image/1ae7-400o400o2-N8oszHftYxRsx2YQtKFpT5.jpg',
          twitter: 'https://twitter.com/reNotANumber',
          linkedIn: 'https://www.linkedin.com/in/renancaraujo/',
        );

  Speaker.anthonyRobledo()
      : this(
          name: 'Anthony Robledo',
          subtitle: 'Material Design at Google',
          imageUrl:
              'https://sessionize.com/image/603d-400o400o2-W6cXM68WY4VaF7cyeyvAvF.png',
        );

  Speaker.andreiTudorDiaconu()
      : this(
          name: 'Andrei Tudor Diaconu',
          subtitle: 'Microsoft Surface Duo DevX',
          imageUrl:
              'https://sessionize.com/image/e9b8-400o400o2-SPdWZHizFXYfzkB41d1R7D.jpg',
          twitter: 'https://twitter.com/andreidiaconu',
          linkedIn: 'https://www.linkedin.com/in/diaconuandrei/',
        );

  Speaker.akanshaJain()
      : this(
          name: 'Akansha Jain',
          subtitle: 'Google Developer Student Clubs Lead',
          imageUrl:
              'https://sessionize.com/image/0a8b-400o400o2-7TEq94j2YMk8qrKVxNPaZE.jpg',
          twitter: 'https://twitter.com/Akansha2001',
          linkedIn: 'https://www.linkedin.com/in/akansha-jain-2001/',
        );
  Speaker.timSneath()
      : this(
          name: 'Tim Sneath',
          subtitle: 'Flutter Product & UX Director, Google',
          imageUrl:
              'https://sessionize.com/image/6893-400o400o2-3fdCoWGQ3X1X6aL2riuSHE.jpg',
          twitter: 'https://twitter.com/timsneath',
          linkedIn: 'https://www.linkedin.com/in/timsneath/',
        );

  Speaker.joachimBohmer()
      : this(
          name: 'Joachim Böhmer',
          subtitle: 'Lead Developer @ Lotum Games',
          imageUrl:
              'https://sessionize.com/image/4093-400o400o2-XG9ZdQXFwqHDeWEuejHb4V.jpg',
          twitter: 'https://twitter.com/kaptnkoala',
        );

  Speaker.justinMcCandless()
      : this(
          name: 'Justin McCandless',
          subtitle: 'Software engineer on the Flutter team at Google',
          imageUrl:
              'https://sessionize.com/image/dbf3-400o400o2-UzKQK5WTkaVvNjwLNoPVqS.jpg',
          twitter: 'https://twitter.com/justinjmcc',
          linkedIn: 'https://www.linkedin.com/in/justinmccandless/',
        );

  Speaker.oleksandrLeushchenko()
      : this(
          name: 'Oleksandr Leushchenko',
          subtitle: 'Tide, Senior Staff Mobile Engineer',
          imageUrl:
              'https://sessionize.com/image/f2aa-400o400o2-NcaQxtYqmb2XpYnHmP4DTY.jpg',
          twitter: 'https://twitter.com/olexale',
          linkedIn: 'https://www.linkedin.com/in/olexale/',
        );

  Speaker.simonLightfoot()
      : this(
          name: 'Simon Lightfoot',
          subtitle: 'Flutter Community Leader and CTO DevAngels London',
          imageUrl:
              'https://sessionize.com/image/ab44-400o400o2-fQDuUeo6o9NWg6AJwFHNpM.jpg',
          twitter: 'https://twitter.com/devangelslondon',
          linkedIn: 'https://www.linkedin.com/in/simonlightfoot',
        );

  Speaker.filipHracek()
      : this(
          name: 'Filip Hráček',
          subtitle: 'Game Developer & Lecturer',
          imageUrl:
              'https://sessionize.com/image/2a47-400o400o2-G7gn75phNdqMyzHy6Yc7wK.jpg',
          twitter: 'https://twitter.com/filiphracek',
        );

  Speaker.efthymiosSarmpanis()
      : this(
          name: 'Efthymios Sarmpanis',
          subtitle: 'GDE Dart & Flutter, CTO at OneRoof',
          imageUrl:
              'https://sessionize.com/image/c52f-400o400o2-WXsKMCEPaMPYyxojGQMpt5.png',
          twitter: 'https://twitter.com/efthemess',
          linkedIn: 'https://www.linkedin.com/in/efthymis/',
        );

  Speaker.thomasBurkhart()
      : this(
          name: 'Thomas Burkhart',
          subtitle: 'GDE Dart & Flutter, CTO at OneRoof',
          imageUrl:
              'https://sessionize.com/image/c162-400o400o2-HtNgzUDGXmR1g3ZYPefNuH.jpg',
          twitter: 'https://twitter.com/ThomasBurkhartB/',
        );

  Speaker.felixAngelov()
      : this(
          name: 'Felix Angelov',
          subtitle: 'Head of Architecture at Very Good Ventures',
          imageUrl:
              'https://sessionize.com/image/9681-400o400o2-NLvwV93zH8MHfqxUtVR47L.jpg',
          twitter: 'https://twitter.com/felangelov',
          linkedIn: 'https://www.linkedin.com/in/felix-angelov/',
        );

  Speaker.ericWindmill()
      : this(
          name: 'Eric Windmill',
          subtitle: 'Flutter and Firebase at Google',
          imageUrl:
              'https://sessionize.com/image/adff-400o400o2-UbCT86iJoV3jj7RbxMQiJg.png',
          twitter: 'https://twitter.com/ericwindmill',
        );

  Speaker.frankVanPuffelen()
      : this(
          name: 'Frank van Puffelen',
          subtitle: 'Firebase Engineer, Google',
          imageUrl:
              'https://sessionize.com/image/4cb6-400o400o2-f3bc9d2c-07fb-4a83-85f1-6fcce23ced00.jpg',
          twitter: 'https://twitter.com/puf',
        );

  Speaker.iiroKrankka()
      : this(
          name: 'Iiro Krankka',
          subtitle: 'Principal Developer at Superlist',
          imageUrl:
              'https://sessionize.com/image/3cfa-400o400o2-ScxakU5uqtLpNrfuDF3zEU.jpg',
          twitter: 'https://twitter.com/koorankka',
        );

  Speaker.teresaWu()
      : this(
          name: 'Teresa wu',
          subtitle: 'VP Engineer at J.P. Morgan, GDE Flutter/Dart',
          imageUrl:
              'https://sessionize.com/image/93eb-400o400o2-96Bx154w1mcLB7F9VeVJ8S.png',
          twitter: 'https://twitter.com/teresa_wyy',
        );

  Speaker.maisAlheraki()
      : this(
          name: 'Mais Alheraki',
          subtitle: 'Software Engineer, Invertase',
          imageUrl:
              'https://sessionize.com/image/94f3-400o400o2-HwbqLDaWcansatv1LcN865.jpg',
          twitter: 'https://twitter.com/pr_Mais',
          linkedIn: 'https://linkedin.com/in/maisalheraki',
        );

  Speaker.guillaumeBernos()
      : this(
          name: 'Guillaume Bernos',
          subtitle: 'Lead Developer',
          imageUrl:
              'https://sessionize.com/image/acd2-400o400o2-XJcZn7vj22kYM1NrfiRJH7.jpg',
          twitter: 'https://twitter.com/BeGuillaume',
          linkedIn: 'https://www.linkedin.com/in/guillaume-bernos/',
        );

  Speaker.michaelHitzker()
      : this(
          name: 'Michael Hitzker',
          subtitle: 'iOS Developer @ tractive',
          imageUrl:
              'https://sessionize.com/image/491b-400o400o2-L8a1wV8SWwoZsiHjM4vDe1.jpg',
          twitter: 'https://www.twitter.com/michaelhitzker',
          linkedIn: 'https://www.linkedin.com/in/michaelhitzker/',
        );

  Speaker.anthonyPrakash()
      : this(
          name: 'Anthony Prakash',
          subtitle: 'Developer Relations and Community Partnerships - Atsign',
          imageUrl:
              'https://sessionize.com/image/2353-400o400o2-a3XJjcDRyLmxMMxgTcbTMg.png',
          twitter: 'https://twitter.com/anthonyvprakash',
          linkedIn: 'https://www.linkedin.com/in/anthony-prakash/',
        );

  Speaker.petraLangenbacher()
      : this(
          name: 'Petra Langenbacher',
          subtitle: 'App Developer at Lotum GmbH',
          imageUrl:
              'https://sessionize.com/image/8944-400o400o2-EHRgDp3tTc17MsmGX923t6.jpg',
          linkedIn: 'https://www.linkedin.com/in/petra-langenbacher/',
        );
  Speaker.matthieuPernelle()
      : this(
          name: 'Matthieu Pernelle',
          subtitle: 'Tech lead - BAM',
          imageUrl:
              'https://sessionize.com/image/9111-400o400o2-UeCa6knRsVaEsLsSBqRbiu.jpg',
          twitter: 'https://twitter.com/thieumalaperne',
          linkedIn: 'https://www.linkedin.com/in/matthieu-pernelle-171a93122/',
        );

  Speaker.wiktoriaSobczyk()
      : this(
          name: 'Wiktoria Sobczyk',
          subtitle: 'Flutter Developer, Personal trainer',
          imageUrl:
              'https://sessionize.com/image/c0d3-400o400o2-K58UEasaAjF6pDYSVPY1pz.jpg',
          linkedIn:
              'https://www.linkedin.com/in/wiktoria-%F0%9F%92%99-sobczyk-965862150/',
        );

  Speaker.kamilKlyta()
      : this(
          name: 'Kamil Klyta',
          subtitle: 'Flutter Developer',
          imageUrl:
              'https://sessionize.com/image/69a2-400o400o2-PcfgpV6r7gnB3YdnVa75Nu.jpg',
          linkedIn: 'https://www.linkedin.com/in/kamil-klyta-281065167/',
        );

  Speaker.renukaKelkar()
      : this(
          name: 'Renuka Kelkar',
          subtitle: 'Flutter GDE | Founder@TechPowerGirls',
          imageUrl:
              'https://sessionize.com/image/bfc9-400o400o2-WUCJfDXXK1eTFbUNnWb7fZ.jpg',
          twitter: 'https://twitter.com/KelkarRenuka',
          linkedIn: 'https://www.linkedin.com/in/renukakelkar/',
        );

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);
  Map<String, dynamic> toJson() => _$SpeakerToJson(this);
}
