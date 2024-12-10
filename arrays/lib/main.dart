class ContactInformation {
  String phoneNumber;
  String email;

  ContactInformation({required this.phoneNumber, required this.email});
}

class NeonAcademyMember {
  String fullName;
  String title;
  String horoscope;
  String memberLevel;
  String homeTown;
  int age;
  ContactInformation contactInformation;
  String? mentorLevel; // Mentor seviyesi

  NeonAcademyMember({
    required this.fullName,
    required this.title,
    required this.horoscope,
    required this.memberLevel,
    required this.homeTown,
    required this.age,
    required this.contactInformation,
    this.mentorLevel, // Opsiyonel özellik
  });
}

void main() {
  List<NeonAcademyMember> members = [
    NeonAcademyMember(
      fullName: "Faruk Biberoğlu",
      title: "A1 Level Flutter Developer",
      horoscope: "Gemini",
      memberLevel: "Beginner",
      homeTown: "Rize",
      age: 25,
      contactInformation: ContactInformation(
        phoneNumber: "5525278453",
        email: "farukbiberoglu34@gmail.com",
      ),
    ),
    NeonAcademyMember(
      fullName: 'Anıl Sorgit',
      title: 'A2 Level Flutter Developer',
      horoscope: 'Leo',
      memberLevel: 'Intermediate',
      homeTown: 'Adana',
      age: 24,
      contactInformation: ContactInformation(
        phoneNumber: "5376489963",
        email: 'anilSorgir@gmail.com',
      ),
    ),
    NeonAcademyMember(
      fullName: "Mehmet Ersoy",
      title: "A2 Level Flutter Developer",
      horoscope: "Gemini",
      memberLevel: "Intermediate",
      homeTown: "Bursa",
      age: 26,
      contactInformation: ContactInformation(
        phoneNumber: "5558978453",
        email: "mehmetGürsoy@gmail.com",
      ),
    ),
    NeonAcademyMember(
      fullName: "Ahmet Köse",
      title: "A2 Level Flutter Developer",
      horoscope: "Aries",
      memberLevel: "Beginner",
      homeTown: "İzmir",
      age: 30,
      contactInformation: ContactInformation(
        phoneNumber: "5558788446",
        email: "ahmetköse@gmail.com",
      ),
    ),
    NeonAcademyMember(
      fullName: "Veli Öztürk",
      title: "A2 Level Flutter Developer",
      horoscope: "Gemini",
      memberLevel: "Intermediate",
      homeTown: "Adana",
      age: 30,
      contactInformation: ContactInformation(
        phoneNumber: "5525896486",
        email: "veliozturk@gmail.com",
      ),
    ),
  ];


  // Üçüncü üyeyi silme
  print('Delete the 3rd member\n');
  members.removeAt(2);

  // Yaşa göre sıralama
  print('Rank the members according to their age from largest to smallest.\n');
  members.sort((a, b) => b.age.compareTo(a.age));
  members.forEach((member) => print('${member.fullName} - ${member.age}'));

  print('\n...........\n');

  // İsimlere göre Z-A sıralama
  print('Sort members by their names (Z-A)\n');
  members.sort((a, b) => b.fullName.compareTo(a.fullName));
  members.forEach((member) => print(member.fullName));

  print('\n...........\n');

  // Yaşı 24'ten büyük üyeleri filtreleme
  print('Filter the members of the Academy who are older than 24 and transfer them to a new array.\n');
  List<NeonAcademyMember> olderMembers = members.where((member) => member.age > 24).toList();
  print("Yaşı 24'ten büyük üyeler:\n");
  olderMembers.forEach((member) => print(member.fullName));

  print('\nPrint the total number of Flutter Developers.\n');

  // Flutter geliştiricilerini sayma
  int flutterDevelopersCount = members
      .where((member) => member.title.contains("Flutter Developer"))
      .length;
  print("Total number of Flutter Developers: $flutterDevelopersCount");

  print('\nFind which index you come across in the array and print it.\n');

  // İlgili üyeyi arama
  int ageIndex = members.indexWhere((member) => member.age == 24);
  print("Yaşı 24 olan ilk üyenin indeksi: $ageIndex");

  // Yeni mentor ekleme
  members.add(
    NeonAcademyMember(
      fullName: "Berkay Baskın",
      title: "A3 Level Flutter Developer",
      horoscope: "Sagittarius",
      memberLevel: "Advanced",
      homeTown: "İstanbul",
      age: 35,
      contactInformation: ContactInformation(
        phoneNumber: "5512345678",
        email: "alican@gmail.com",
      ),
      mentorLevel: "Senior",
    ),
  );

  print("\nTüm üyeler:");
  members.forEach((member) => print(member.fullName));

  // "Beginner" seviyesindeki üyeleri silme
  members.removeWhere((member) => member.memberLevel == "Beginner");

  // Kalan üyelerin adlarını yazdırma
  print("\nRemaining Members After Removing Beginners:");
  members.forEach((member) => print(member.fullName));

  // En yaşlı üyeyi bulma
  print('.......');

  NeonAcademyMember oldestMember = members.reduce((current, next) =>
  current.age > next.age ? current : next
  );

  // Sonucu yazdırma
  print("Oldest Member: ${oldestMember.fullName}, Age: ${oldestMember.age}");

  // Adı en uzun üyeyi bulma
  NeonAcademyMember memberWithLongestName = members.reduce((current, next) =>
  current.fullName.length > next.fullName.length ? current : next
  );

  // Sonucu yazdırma
  print("Member with the Longest Name: ${memberWithLongestName.fullName}, Length: ${memberWithLongestName.fullName.length}");

  var grouped = {
    'Gemini': members.where((member) => member.horoscope == 'Gemini').toList(),
    'Leo': members.where((member) => member.horoscope == 'Leo').toList(),
    'Aries': members.where((member) => member.horoscope == 'Aries').toList(),
    'Sagittarius': members.where((member) => member.horoscope == 'Sagittarius').toList(),
  };

  grouped.forEach((horoscope, membersList) {
    if (membersList.isNotEmpty) {
      print('$horoscope Burcu Üyeler:');
      membersList.forEach((member) => print(member.fullName));
    }
  });


  // En yaygın kasabayı bulma
  Map<String, int> homeTownCount = {};

  // Tüm üyelerin hometown'larını sayma
  for (var member in members) {
    homeTownCount[member.homeTown] = (homeTownCount[member.homeTown] ?? 0) + 1;
  }

  // En yaygın hometown'ı bulma
  String mostCommonHomeTown = homeTownCount.entries.reduce((a, b) => a.value > b.value ? a : b).key;

  print("En yaygın kasaba: $mostCommonHomeTown");


  int totalAge = 0;
  for (var member in members) {
    totalAge += member.age;
  }

  // Ortalama yaşı hesapla
  double averageAge = totalAge / members.length;

  // Sonucu yazdır
  print("Tüm üyelerin yaşlarının ortalaması: $averageAge");

  List<ContactInformation> contactInfoArray = members.map((member) => member.contactInformation).toList();

  // E-posta adreslerini yazdırıyoruz
  for (var contact in contactInfoArray) {
    print(contact.email);
  }
  // Üyeleri memberLevel'a göre sıralama (en yüksekten en düşüğe)
// Üyeleri memberLevel'a göre sıralama (en yüksekten en düşüğe)
  members.sort((a, b) {
    const levels = ['Beginner', 'Intermediate', 'Advanced']; // Sıralama düzeyini değiştirdik
    return levels.indexOf(b.memberLevel) - levels.indexOf(a.memberLevel); // "b" önce olmalı
  });

// Üyeleri tam adıyla yazdırma
  print('Members sorted by memberLevel (Highest to Lowest):');
  members.forEach((member) => print(member.fullName));

  // Aynı unvana sahip üyeleri grupla ve telefon numaraları ile tam adlarını yazdır
  print('\nFind all members who have the same title and print their full name and phone numbers.\n');

  Map<String, List<NeonAcademyMember>> titleGrouped = {};

  for (var member in members) {
    if (!titleGrouped.containsKey(member.title)) {
      titleGrouped[member.title] = [];
    }
    titleGrouped[member.title]!.add(member);
  }

  titleGrouped.forEach((title, group) {
    if (group.length > 1) {  // Eğer aynı unvana sahip birden fazla üye varsa
      print('Title: $title');
      group.forEach((member) {
        print('Full Name: ${member.fullName}, Phone Number: ${member.contactInformation.phoneNumber}');
      });
    }
  });






}
