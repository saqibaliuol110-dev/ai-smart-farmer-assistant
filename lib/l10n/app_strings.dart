import '../providers/locale_provider.dart';

class AppStrings {
  static final Map<String, Map<AppLanguage, String>> _strings = {
    // General App
    'app_title': {
      AppLanguage.english: 'AgriTech Edge AI',
      AppLanguage.urdu: 'ایگری ٹیک ایج اے آئی',
      AppLanguage.sindhi: 'ايگري ٽيڪ ايج اي آءِ',
    },
    'app_subtitle': {
      AppLanguage.english: 'Smart Offline Crop Diagnosis & Advisory',
      AppLanguage.urdu: 'سمارٹ آف لائن فصل کی تشخیص اور مشورہ',
      AppLanguage.sindhi: 'سمارٽ آف لائن فصل جي تشخيص ۽ صلاح',
    },
    'get_started': {
      AppLanguage.english: 'Get Started',
      AppLanguage.urdu: 'شروع کریں',
      AppLanguage.sindhi: 'شروع ڪريو',
    },
    'badge_edge_ai': {
      AppLanguage.english: 'Edge AI Diagnosis',
      AppLanguage.urdu: 'ایج اے آئی تشخیص',
      AppLanguage.sindhi: 'ايج اي آءِ تشخيص',
    },
    'badge_offline': {
      AppLanguage.english: '100% Offline',
      AppLanguage.urdu: '100% آف لائن',
      AppLanguage.sindhi: '100% آف لائن',
    },
    'badge_crop_advisor': {
      AppLanguage.english: 'Crop Advisor',
      AppLanguage.urdu: 'فصل کا مشیر',
      AppLanguage.sindhi: 'فصل جو صلاحڪار',
    },
    'nav_crop_rec': {
      AppLanguage.english: 'Crop Rec',
      AppLanguage.urdu: 'فصل سفارش',
      AppLanguage.sindhi: 'فصل سفارش',
    },
    'nav_dr_leaf': {
      AppLanguage.english: 'Dr. Leaf',
      AppLanguage.urdu: 'ڈاکٹر لیف',
      AppLanguage.sindhi: 'ڊاڪٽر ليف',
    },
    'language': {
      AppLanguage.english: 'Language',
      AppLanguage.urdu: 'زبان',
      AppLanguage.sindhi: 'ٻولي',
    },
    'select_language': {
      AppLanguage.english: 'Select Language',
      AppLanguage.urdu: 'زبان منتخب کریں',
      AppLanguage.sindhi: 'ٻولي چونڊيو',
    },

    // Disease Doctor Screen
    'dr_leaf_title': {
      AppLanguage.english: 'Dr. Leaf',
      AppLanguage.urdu: 'ڈاکٹر لیف (پودوں کا ڈاکٹر)',
      AppLanguage.sindhi: 'ڊاڪٽر ليف (ٻوٽن جو ڊاڪٽر)',
    },
    'tap_add_photo': {
      AppLanguage.english: 'Tap to Add Leaf Photo',
      AppLanguage.urdu: 'پتے کی تصویر لگانے کے لیے دبائیں',
      AppLanguage.sindhi: 'پن جي تصوير رکڻ لاءِ دٻايو',
    },
    'select_photo_hint': {
      AppLanguage.english: 'Select a photo to diagnose possible illnesses.',
      AppLanguage.urdu: 'ممکنہ بیماریوں کی تشخیص کے لیے تصویر منتخب کریں۔',
      AppLanguage.sindhi: 'ممڪن بيمارين جي تشخيص لاءِ تصوير چونڊيو.',
    },
    'analyzing_plant': {
      AppLanguage.english: 'Dr. Leaf is analyzing your plant inside an Isolate...',
      AppLanguage.urdu: 'ڈاکٹر لیف آپ کے پودے کے پتے کا معائنہ کر رہا ہے...',
      AppLanguage.sindhi: 'ڊاڪٽر ليف اوهان جي ٻوٽي جي پن جو معائنو ڪري رهيو آهي...',
    },
    'scan_field': {
      AppLanguage.english: 'Scan Field',
      AppLanguage.urdu: 'کھیت اسکین کریں',
      AppLanguage.sindhi: 'کيت اسڪين ڪريو',
    },
    'cause': {
      AppLanguage.english: 'Cause',
      AppLanguage.urdu: 'بیماری کی وجہ',
      AppLanguage.sindhi: 'بيماري جو سبب',
    },
    'cure': {
      AppLanguage.english: 'Cure & Treatment',
      AppLanguage.urdu: 'علاج اور بچاؤ',
      AppLanguage.sindhi: 'علاج ۽ بچاءُ',
    },
    'confidence': {
      AppLanguage.english: 'Confidence',
      AppLanguage.urdu: 'درستی',
      AppLanguage.sindhi: 'درستي',
    },
    'scan_again': {
      AppLanguage.english: 'Scan Again',
      AppLanguage.urdu: 'دوبارہ اسکین کریں',
      AppLanguage.sindhi: 'ٻيهر اسڪين ڪريو',
    },
    'invalid_image_title': {
      AppLanguage.english: 'Invalid Image',
      AppLanguage.urdu: 'ناقابل قبول تصویر',
      AppLanguage.sindhi: 'ناقابل قبول تصوير',
    },
    'invalid_image_msg': {
      AppLanguage.english: 'This does not appear to be a crop leaf. Please scan a valid plant leaf.',
      AppLanguage.urdu: 'یہ فصل کا پتہ معلوم نہیں ہوتا۔ براہ کرم کسی درست پودے کے پتے کو اسکین کریں۔',
      AppLanguage.sindhi: 'هي فصل جو پن نٿو لڳي. مهرباني ڪري ڪنهن صحيح ٻوٽي جي پن کي اسڪين ڪريو.',
    },
    'unsupported_plant_title': {
      AppLanguage.english: 'Unsupported Plant',
      AppLanguage.urdu: 'غیر معاون پودا',
      AppLanguage.sindhi: 'غير سهڪاري ٻوٽو',
    },
    'unsupported_plant_msg': {
      AppLanguage.english: 'Our app currently only supports Tomato, Rice, Wheat, and Cotton. Please scan one of these crops.',
      AppLanguage.urdu: 'ہماری ایپ فی الحال صرف ٹماٹر، چاول، گندم اور کپاس کو سپورٹ کرتی ہے۔ براہ کرم ان میں سے کسی ایک فصل کو اسکین کریں۔',
      AppLanguage.sindhi: 'اسان جي ايپ في الحال صرف ٽماٽو، چانور، ڪڻڪ ۽ ڪپهه کي سپورٽ ڪري ٿي. مهرباني ڪري انهن مان ڪنهن هڪ فصل کي اسڪين ڪريو.',
    },
    'uncertain_result_title': {
      AppLanguage.english: 'Uncertain Identification',
      AppLanguage.urdu: 'غیر یقینی شناخت',
      AppLanguage.sindhi: 'غير يقيني سڃاڻپ',
    },
    'uncertain_result_msg': {
      AppLanguage.english: 'Unable to identify reliably. Please retake a clear photo of the affected plant leaf.',
      AppLanguage.urdu: 'یقینی طور پر شناخت ممکن نہیں ہو سکی۔ براہ کرم متاثرہ پتے کی واضح تصویر دوبارہ لیں۔',
      AppLanguage.sindhi: 'يقيني طور سڃاڻپ ممڪن نه ٿي سگهي. مهرباني ڪري متاثر پن جي صاف تصوير ٻيهر ڪڍو.',
    },

    // Crop Recommendation Screen
    'crop_rec_title': {
      AppLanguage.english: 'Crop Recommendation',
      AppLanguage.urdu: 'فصل کی تجویز',
      AppLanguage.sindhi: 'فصل جي تجويز',
    },
    'quick_guide': {
      AppLanguage.english: 'Quick Guide',
      AppLanguage.urdu: 'فوری رہنمائی',
      AppLanguage.sindhi: 'فوري رهنمائي',
    },
    'lab_data': {
      AppLanguage.english: 'Lab Data',
      AppLanguage.urdu: 'لیب ڈیٹا',
      AppLanguage.sindhi: 'ليبارٽري ڊيٽا',
    },
    'find_best_crops': {
      AppLanguage.english: 'Find Best Crops',
      AppLanguage.urdu: 'بہترین فصلیں تلاش کریں',
      AppLanguage.sindhi: 'بهترين فصل ڳوليو',
    },
    'top_recommendations': {
      AppLanguage.english: 'Top Recommendations:',
      AppLanguage.urdu: 'تجویز کردہ فصلیں:',
      AppLanguage.sindhi: 'تجويز ڪيل فصل:',
    },
    'click_to_recommend': {
      AppLanguage.english: 'Click the button to see recommendations based on your inputs.',
      AppLanguage.urdu: 'اپنی منتخب معلومات کی بنیاد پر سفارشات دیکھنے کے لیے بٹن دبائیں۔',
      AppLanguage.sindhi: 'پنهنجي چونڊيل معلومات جي بنياد تي تجويزون ڏسڻ لاءِ بٽڻ دٻايو.',
    },
    'match': {
      AppLanguage.english: 'Match',
      AppLanguage.urdu: 'مطابقت',
      AppLanguage.sindhi: 'مطابقت',
    },
    'harvest_in': {
      AppLanguage.english: 'Harvest in',
      AppLanguage.urdu: 'تیاری کا دورانیہ:',
      AppLanguage.sindhi: 'تياري جو مدو:',
    },
    'soil_question': {
      AppLanguage.english: '1. What does your soil look like?',
      AppLanguage.urdu: '1. آپ کی زمین کی مٹی کیسی ہے؟',
      AppLanguage.sindhi: '1. اوهان جي زمين جي مٽي ڪهڙي قسم جي آهي؟',
    },
    'season_question': {
      AppLanguage.english: '2. What season are you planting for?',
      AppLanguage.urdu: '2. آپ کس موسم کے لیے کاشت کر رہے ہیں؟',
      AppLanguage.sindhi: '2. اوهان ڪهڙي موسم لاءِ پوکي رهيا آهيو؟',
    },
    'sandy': {
      AppLanguage.english: 'Sandy',
      AppLanguage.urdu: 'ریتلی',
      AppLanguage.sindhi: 'ريتيلي',
    },
    'sandy_sub': {
      AppLanguage.english: 'Light & Dry',
      AppLanguage.urdu: 'ہلکی اور خشک',
      AppLanguage.sindhi: 'هلڪي ۽ خشڪ',
    },
    'loamy': {
      AppLanguage.english: 'Loamy',
      AppLanguage.urdu: 'زرخیز (میرا)',
      AppLanguage.sindhi: 'زرخيز (ميرا)',
    },
    'loamy_sub': {
      AppLanguage.english: 'Rich & Dark',
      AppLanguage.urdu: 'زرخیز اور گہری',
      AppLanguage.sindhi: 'زرخيز ۽ گهري',
    },
    'clay': {
      AppLanguage.english: 'Clay',
      AppLanguage.urdu: 'چکنی مٹی',
      AppLanguage.sindhi: 'چڪني مٽي',
    },
    'clay_sub': {
      AppLanguage.english: 'Heavy & Wet',
      AppLanguage.urdu: 'بھاری اور نمی والی',
      AppLanguage.sindhi: 'ڳري ۽ آلي',
    },
    'summer': {
      AppLanguage.english: 'Summer',
      AppLanguage.urdu: 'گرمی',
      AppLanguage.sindhi: 'گرمي',
    },
    'kharif': {
      AppLanguage.english: 'Kharif',
      AppLanguage.urdu: 'خریف',
      AppLanguage.sindhi: 'خريف',
    },
    'winter': {
      AppLanguage.english: 'Winter',
      AppLanguage.urdu: 'سردی',
      AppLanguage.sindhi: 'سردي',
    },
    'rabi': {
      AppLanguage.english: 'Rabi',
      AppLanguage.urdu: 'ربیع',
      AppLanguage.sindhi: 'ربيع',
    },
    'nitrogen': {
      AppLanguage.english: 'Nitrogen (N)',
      AppLanguage.urdu: 'نائٹروجن (N)',
      AppLanguage.sindhi: 'نائٽروجن (N)',
    },
    'phosphorus': {
      AppLanguage.english: 'Phosphorus (P)',
      AppLanguage.urdu: 'فاسفورس (P)',
      AppLanguage.sindhi: 'فاسفورس (P)',
    },
    'potassium': {
      AppLanguage.english: 'Potassium (K)',
      AppLanguage.urdu: 'پوٹاشیم (K)',
      AppLanguage.sindhi: 'پوٽاشيم (K)',
    },
    'soil_ph': {
      AppLanguage.english: 'Soil pH',
      AppLanguage.urdu: 'مٹی کی پی ایچ (pH)',
      AppLanguage.sindhi: 'مٽي جي پي ايڇ (pH)',
    },
    'temperature': {
      AppLanguage.english: 'Temperature (°C)',
      AppLanguage.urdu: 'درجہ حرارت (°C)',
      AppLanguage.sindhi: 'گرمي پد (°C)',
    },
  };

  // 14 Disease Class Display Names
  static final Map<String, Map<AppLanguage, String>> _diseaseDisplayNames = {
    'Cotton_Bacterial_Blight': {
      AppLanguage.english: 'Cotton Bacterial Blight',
      AppLanguage.urdu: 'کپاس کا بیکٹیریل بلائیٹ',
      AppLanguage.sindhi: 'ڪپهه جو بئڪٽيريل بلائيٽ',
    },
    'Cotton_Diseased': {
      AppLanguage.english: 'Cotton Diseased Leaf',
      AppLanguage.urdu: 'کپاس کا بیمار پتہ',
      AppLanguage.sindhi: 'ڪپهه جو بيمار پن',
    },
    'Cotton_Healthy': {
      AppLanguage.english: 'Cotton Healthy',
      AppLanguage.urdu: 'کپاس کی صحت مند فصل',
      AppLanguage.sindhi: 'ڪپهه جو صحتمند فصل',
    },
    'Not_A_Plant': {
      AppLanguage.english: 'Not A Plant Leaf',
      AppLanguage.urdu: 'پودے کا پتہ نہیں ہے',
      AppLanguage.sindhi: 'ٻوٽي جو پن ناهي',
    },
    'Other_Leaves': {
      AppLanguage.english: 'Unsupported Plant Species',
      AppLanguage.urdu: 'غیر معاون پودا',
      AppLanguage.sindhi: 'غير سهڪاري ٻوٽو',
    },
    'Rice_Brown_Spot': {
      AppLanguage.english: 'Rice Brown Spot',
      AppLanguage.urdu: 'چاول کا بھورا دھبہ (براؤن اسپاٹ)',
      AppLanguage.sindhi: 'چانورن جو ناسي چٽو (براؤن اسپاٽ)',
    },
    'Rice_Healthy': {
      AppLanguage.english: 'Rice Healthy',
      AppLanguage.urdu: 'چاول کی صحت مند فصل',
      AppLanguage.sindhi: 'چانورن جو صحتمند فصل',
    },
    'Rice_Leaf_Blast': {
      AppLanguage.english: 'Rice Leaf Blast',
      AppLanguage.urdu: 'چاول کا جھلساؤ (لیف بلاسٹ)',
      AppLanguage.sindhi: 'چانورن جو سڙيل پن (ليف بلاسٽ)',
    },
    'Tomato_Early_Blight': {
      AppLanguage.english: 'Tomato Early Blight',
      AppLanguage.urdu: 'ٹماٹر کا اگیتا جھلساؤ (ارلی بلائیٹ)',
      AppLanguage.sindhi: 'ٽماٽي جو اڳواٽ سڙيل پن (ارلي بلائيٽ)',
    },
    'Tomato_Healthy': {
      AppLanguage.english: 'Tomato Healthy',
      AppLanguage.urdu: 'ٹماٹر کی صحت مند فصل',
      AppLanguage.sindhi: 'ٽماٽي جو صحتمند فصل',
    },
    'Tomato_Late_Blight': {
      AppLanguage.english: 'Tomato Late Blight',
      AppLanguage.urdu: 'ٹماٹر کا پچھیتا جھلساؤ (لیٹ بلائیٹ)',
      AppLanguage.sindhi: 'ٽماٽي جو پڇاڙي سڙيل پن (ليٽ بلائيٽ)',
    },
    'Wheat_Brown_Rust': {
      AppLanguage.english: 'Wheat Brown Rust',
      AppLanguage.urdu: 'گندم کی بھوری کنگی (براؤن رسٹ)',
      AppLanguage.sindhi: 'ڪڻڪ جو ناسي ڪنگي (براؤن رٽ)',
    },
    'Wheat_Healthy': {
      AppLanguage.english: 'Wheat Healthy',
      AppLanguage.urdu: 'گندم کی صحت مند فصل',
      AppLanguage.sindhi: 'ڪڻڪ جو صحتمند فصل',
    },
    'Wheat_Yellow_Rust': {
      AppLanguage.english: 'Wheat Yellow Rust',
      AppLanguage.urdu: 'گندم کی پیلی کنگی (ییلو رسٹ)',
      AppLanguage.sindhi: 'ڪڻڪ جو پيلو ڪنگي (ييلو رٽ)',
    },
  };

  // Localized Causes & Cures
  static final Map<String, Map<String, Map<AppLanguage, String>>> _diseaseClinicalInfo = {
    'Cotton_Bacterial_Blight': {
      'cause': {
        AppLanguage.english: 'Pathogen Xanthomonas citri pv. malvacearum. Spread by water splashes, wind-blown rain, or contaminated seeds.',
        AppLanguage.urdu: 'بیکٹیریم زانتھوموناس۔ بارش کے پانی، ہوا اور متاثرہ بیجوں کے ذریعے پھیلتا ہے۔',
        AppLanguage.sindhi: 'جراثيم زينٿوموناس. برسات جي پاڻي، هوا ۽ متاثر ٻجن ذريعي پکڙجي ٿو.',
      },
      'cure': {
        AppLanguage.english: 'Use acid-delinted seed, plant resistant varieties, and apply copper-based fungicides when symptoms appear.',
        AppLanguage.urdu: 'صاف شدہ اور مزاحم بیج استعمال کریں، اور علامات ظاہر ہونے پر کاپر فنگسائیڈ کا اسپرے کریں۔',
        AppLanguage.sindhi: 'صاف ۽ مزاحمتي ٻج استعمال ڪريو، ۽ علامتون ظاهر ٿيڻ تي ڪاپر فنگسائيڊ اسپري ڪريو.',
      },
    },
    'Cotton_Diseased': {
      'cause': {
        AppLanguage.english: 'General fungal/bacterial leaf spot infections or nutrient deficiencies.',
        AppLanguage.urdu: 'پتوں پر پھپھوندی یا بیکٹیریا کے دھبے یا غذائی اجزاء کی کمی۔',
        AppLanguage.sindhi: 'پنن تي فنگس يا بئڪٽيريا جا داغ يا غذائي جزن جي کوٽ.',
      },
      'cure': {
        AppLanguage.english: 'Monitor fields, remove infected leaves, ensure proper crop rotation, and apply broad-spectrum bio-fungicides.',
        AppLanguage.urdu: 'متاثرہ پتے کاٹ کر تلف کریں، مناسب فصل کا ہیر پھیر کریں اور معیاری فنگس کش دوا کا اسپرے کریں۔',
        AppLanguage.sindhi: 'متاثر پن ڪٽي ختم ڪريو، فصل جي ڦيرڦار ڪريو ۽ معياري فنگس مار دوا اسپري ڪريو.',
      },
    },
    'Cotton_Healthy': {
      'cause': {
        AppLanguage.english: 'Excellent crop management, proper irrigation, balanced soil nutrients, and robust plant genetics.',
        AppLanguage.urdu: 'بہترین نگہداشت، متوازن کھادیں اور بروقت آبپاشی۔',
        AppLanguage.sindhi: 'بهترين سنڀال، متوازن ڀاڻ ۽ وقت سر پاڻي ڏيڻ.',
      },
      'cure': {
        AppLanguage.english: 'No treatment required. Maintain current watering schedule and soil nutrition.',
        AppLanguage.urdu: 'کسی علاج کی ضرورت نہیں۔ موجودہ کھاد اور پانی کا شیڈول برقرار رکھیں۔',
        AppLanguage.sindhi: 'ڪنهن علاج جي ضرورت ناهي. هاڻوڪو ڀاڻ ۽ پاڻي جو شيڊول برقرار رکو.',
      },
    },
    'Not_A_Plant': {
      'cause': {
        AppLanguage.english: 'The scanned image does not contain a recognized crop leaf.',
        AppLanguage.urdu: 'اسکین کی گئی تصویر میں پودے کا پتہ موجود نہیں ہے۔',
        AppLanguage.sindhi: 'اسڪين ڪيل تصوير ۾ ٻوٽي جو پن موجود ناهي.',
      },
      'cure': {
        AppLanguage.english: 'This does not appear to be a crop leaf. Please scan a valid plant leaf.',
        AppLanguage.urdu: 'براہ کرم پودے کے واضح اور صاف پتے کی تصویر کھینچیں۔',
        AppLanguage.sindhi: 'مهرباني ڪري ٻوٽي جي واضح ۽ صاف پن جي تصوير ڪڍو.',
      },
    },
    'Other_Leaves': {
      'cause': {
        AppLanguage.english: 'The scanned leaf belongs to an unsupported plant species.',
        AppLanguage.urdu: 'اس پودے کی قسم فی الحال سپورٹڈ فہرست میں شامل نہیں ہے۔',
        AppLanguage.sindhi: 'هن ٻوٽي جو قسم في الحال شامل ناهي.',
      },
      'cure': {
        AppLanguage.english: 'Our app currently only supports Tomato, Rice, Wheat, and Cotton. Please scan one of these crops.',
        AppLanguage.urdu: 'ہماری ایپ فی الحال ٹماٹر، چاول، گندم اور کپاس کو سپورٹ کرتی ہے۔',
        AppLanguage.sindhi: 'اسان جي ايپ في الحال ٽماٽو، چانور، ڪڻڪ ۽ ڪپهه کي سپورٽ ڪري ٿي.',
      },
    },
    'Rice_Brown_Spot': {
      'cause': {
        AppLanguage.english: 'Fungus Bipolaris oryzae. Often associated with nutrient-deficient or water-stressed soils.',
        AppLanguage.urdu: 'پھپھوندی بائی پولارس۔ عام طور پر پوٹاشیم کی کمی یا پانی کی قلت کی وجہ سے ہوتا ہے۔',
        AppLanguage.sindhi: 'فنگس بائي پولارس. گهڻو ڪري پوٽاشيم جي کوٽ يا پاڻي جي تنگي سبب ٿيندو آهي.',
      },
      'cure': {
        AppLanguage.english: 'Apply balanced NPK fertilizers (especially potassium), improve water drainage, and use certified disease-free seeds.',
        AppLanguage.urdu: 'متوازن کھاد (خاص طور پر پوٹاش) کا استعمال کریں اور نکاسی آب بہتر بنائیں۔',
        AppLanguage.sindhi: 'متوازن ڀاڻ (خاص ڪري پوٽاش) استعمال ڪريو ۽ پاڻي جي نيڪال سٺي رکو.',
      },
    },
    'Rice_Healthy': {
      'cause': {
        AppLanguage.english: 'Ideal soil moisture, optimized nitrogen levels, and healthy nursery preparation.',
        AppLanguage.urdu: 'بہترین پنیری، متوازن کھادیں اور باقاعدہ پانی کی فراہمی۔',
        AppLanguage.sindhi: 'بهترين پني، متوازن ڀاڻ ۽ باقاعدي پاڻي جي فراهمي.',
      },
      'cure': {
        AppLanguage.english: 'No treatment required. Keep monitoring water levels and apply scheduled fertilizer.',
        AppLanguage.urdu: 'کسی علاج کی ضرورت نہیں۔ پانی اور کھاد کا معمول جاری رکھیں۔',
        AppLanguage.sindhi: 'ڪنهن علاج جي ضرورت ناهي. پاڻي ۽ ڀاڻ جو معمول جاري رکو.',
      },
    },
    'Rice_Leaf_Blast': {
      'cause': {
        AppLanguage.english: 'Fungus Magnaporthe oryzae. Thrives in high humidity, warm nights, and excessive nitrogen.',
        AppLanguage.urdu: 'پھپھوندی میگناپورتی۔ زیادہ نمی، گرم راتوں اور یوریا کے زیادہ استعمال سے پھیلتی ہے۔',
        AppLanguage.sindhi: 'فنگس ميگناپورٿي. وڌيڪ نمي، گرم راتين ۽ يوريا جي زيادتي سان پکڙجي ٿي.',
      },
      'cure': {
        AppLanguage.english: 'Avoid excessive nitrogen fertilizer, maintain consistent water depth, and apply systemic fungicides like Tricyclazole if needed.',
        AppLanguage.urdu: 'یوریا کا بے جا استعمال روکیں، اور ٹرائی سائیکلازول فنگسائیڈ کا اسپرے کریں۔',
        AppLanguage.sindhi: 'يوريا جو وڌيڪ واهپو روڪيو، ۽ ٽرائي سائيڪلازول فنگسائيڊ اسپري ڪريو.',
      },
    },
    'Tomato_Early_Blight': {
      'cause': {
        AppLanguage.english: 'Fungus Alternaria solani. Thrives in warm, humid conditions; overwinters in crop debris and soil.',
        AppLanguage.urdu: 'پھپھوندی الٹرنیریا سولانی۔ گرم اور مرطوب موسم میں پھیلتی ہے۔',
        AppLanguage.sindhi: 'فنگس الٽرنيريا سولاني. گرم ۽ نمي واري موسم ۾ تيزي سان وڌندي آهي.',
      },
      'cure': {
        AppLanguage.english: 'Practice crop rotation, prune lower branches to improve airflow, mulch around plants, and apply copper fungicides weekly.',
        AppLanguage.urdu: 'نچلی شاخیں کاٹیں تاکہ ہوا لگے، اور کاپر فنگسائیڈ کا باقاعدگی سے اسپرے کریں۔',
        AppLanguage.sindhi: 'هيٺيون ٽاريون ڇانٽيو ته جيئن هوا لڳي، ۽ ڪاپر فنگسائيڊ جو باقاعدي اسپري ڪريو.',
      },
    },
    'Tomato_Healthy': {
      'cause': {
        AppLanguage.english: 'Good plant spacing, dry foliage watering (drip irrigation), and nutrient-rich soil.',
        AppLanguage.urdu: 'مناسب فاصلہ، جڑوں میں پانی اور زرخیز مٹی۔',
        AppLanguage.sindhi: 'مناسب وٿي، پاڙن ۾ پاڻي ۽ ڀلي مٽي.',
      },
      'cure': {
        AppLanguage.english: 'No treatment required. Keep watering at the base of the plant to prevent leaf wetness.',
        AppLanguage.urdu: 'کسی علاج کی ضرورت نہیں۔ پتوں پر پانی ڈالنے کے بجائے جڑوں میں پانی دیں۔',
        AppLanguage.sindhi: 'ڪنهن علاج جي ضرورت ناهي. پنن بدران پاڙن ۾ پاڻي ڏيو.',
      },
    },
    'Tomato_Late_Blight': {
      'cause': {
        AppLanguage.english: 'Oomycete Phytophthora infestans. Highly destructive, thrives in cool, wet weather.',
        AppLanguage.urdu: 'فائٹوپتھورا انفیسٹانس۔ ٹھنڈے اور گیلے موسم میں انتہائی تیزی سے تباہی مچاتا ہے۔',
        AppLanguage.sindhi: 'فائٽوپٿورا انفيستنس. ٿڌي ۽ آلي موسم ۾ انتهائي تيزي سان نقصان پهچائي ٿو.',
      },
      'cure': {
        AppLanguage.english: 'Immediately destroy infected plants, use certified disease-free transplants, and apply preventative chlorothalonil or copper fungicides.',
        AppLanguage.urdu: 'شدید متاثرہ پودے نکال کر جلائیں، اور حفاظتی طور پر کلوروتھالونل یا کاپر فنگسائیڈ کا اسپرے کریں۔',
        AppLanguage.sindhi: 'تمام گهڻا متاثر ٻوٽا پٽي ساڙي ڇڏيو، ۽ بچاءَ لاءِ ڪلوروٿالونيل يا ڪاپر فنگسائيڊ اسپري ڪريو.',
      },
    },
    'Wheat_Brown_Rust': {
      'cause': {
        AppLanguage.english: 'Fungus Puccinia triticina. Air-borne spores spread quickly in warm (15-22°C) and humid conditions.',
        AppLanguage.urdu: 'پھپھوندی پکسینیا۔ ہوا کے ذریعے 15 تا 22 ڈگری درجہ حرارت میں تیزی سے پھیلتی ہے۔',
        AppLanguage.sindhi: 'فنگس پڪسينيا. هوا ذريعي 15 کان 22 درجا گرمي پد ۾ تيزي سان پکڙجي ٿي.',
      },
      'cure': {
        AppLanguage.english: 'Grow rust-resistant cultivars, sow early, and apply triazole fungicides (e.g., Tebuconazole) if infection exceeds threshold.',
        AppLanguage.urdu: 'رسٹ کے خلاف مزاحم اقسام کاشت کریں اور ضرورت پڑنے پر ٹیبوکونازول فنگسائیڈ کا اسپرے کریں۔',
        AppLanguage.sindhi: 'رٽ خلاف مزاحمتي ٻج پوکيو ۽ ضرورت پوڻ تي ٽيبوڪونازول فنگسائيڊ اسپري ڪريو.',
      },
    },
    'Wheat_Healthy': {
      'cause': {
        AppLanguage.english: 'Resistant wheat cultivars, early sowing, and optimal nitrogen-potassium ratio.',
        AppLanguage.urdu: 'بروقت بوائی، متوازن کھادیں اور معیاری بیج۔',
        AppLanguage.sindhi: 'وقت سر پوکي، متوازن ڀاڻ ۽ سٺو ٻج.',
      },
      'cure': {
        AppLanguage.english: 'No treatment required. Maintain regular field inspection and weed management.',
        AppLanguage.urdu: 'کسی علاج کی ضرورت نہیں۔ جڑی بوٹیوں کی تلفی جاری رکھیں۔',
        AppLanguage.sindhi: 'ڪنهن علاج جي ضرورت ناهي. گند گاهه جي صفائي جاري رکو.',
      },
    },
    'Wheat_Yellow_Rust': {
      'cause': {
        AppLanguage.english: 'Fungus Puccinia striiformis. Air-borne spores, favors cooler temperatures (10-15°C) and dew.',
        AppLanguage.urdu: 'پھپھوندی پکسینیا اسٹرائیفارمس۔ ٹھنڈے موسم (10 تا 15 ڈگری) اور شبنم میں پھیلتی ہے۔',
        AppLanguage.sindhi: 'فنگس پڪسينيا اسٽرائي فارمس. ٿڌي موسم (10 کان 15 درجا) ۽ شبنم ۾ پکڙجي ٿي.',
      },
      'cure': {
        AppLanguage.english: 'Plant resistant varieties, monitor fields in early spring, and apply systemic fungicides like Propiconazole immediately upon detection.',
        AppLanguage.urdu: 'مزاحم بیج بوئیں اور بیماری دیکھتے ہی پروپیکونازول کا اسپرے کریں۔',
        AppLanguage.sindhi: 'مزاحمتي ٻج پوکيو ۽ بيماري ڏسندي ئي پروپيڪونازول اسپري ڪريو.',
      },
    },
  };

  // Localized Crop Names & Descriptions
  static final Map<String, Map<String, Map<AppLanguage, String>>> _cropTranslations = {
    'Cotton': {
      'name': {
        AppLanguage.english: 'Cotton',
        AppLanguage.urdu: 'کپاس (پھٹی)',
        AppLanguage.sindhi: 'ڪپهه (ڦٽي)',
      },
      'description': {
        AppLanguage.english: 'A major cash crop best suited for warm climates and well-drained loamy soil.',
        AppLanguage.urdu: 'ایک اہم نقد آور فصل جو گرم موسم اور زرخیز میرا زمین کے لیے موزوں ہے۔',
        AppLanguage.sindhi: 'هڪ اهم نقد واري فصل جيڪا گرم موسم ۽ زرخيز ميرا زمين لاءِ تمام سٺي آهي.',
      },
      'season': {
        AppLanguage.english: 'April - May (Kharif)',
        AppLanguage.urdu: 'اپریل - مئی (خریف)',
        AppLanguage.sindhi: 'اپريل - مئي (خريف)',
      },
      'harvest': {
        AppLanguage.english: '150 - 180 Days',
        AppLanguage.urdu: '150 - 180 دن',
        AppLanguage.sindhi: '150 - 180 ڏينهن',
      },
    },
    'Rice': {
      'name': {
        AppLanguage.english: 'Rice',
        AppLanguage.urdu: 'چاول (دھان)',
        AppLanguage.sindhi: 'چانور (سارين)',
      },
      'description': {
        AppLanguage.english: 'Requires high water retention and heavy clay soils. Ideal for monsoon season.',
        AppLanguage.urdu: 'پانی برقرار رکھنے والی چکنی مٹی کی ضرورت ہوتی ہے۔ مون سون کے لیے بہترین۔',
        AppLanguage.sindhi: 'پاڻي جهليندڙ چڪني مٽي جي ضرورت هوندي آهي. برساتي موسم لاءِ بهترين.',
      },
      'season': {
        AppLanguage.english: 'May - June (Kharif)',
        AppLanguage.urdu: 'مئی - جون (خریف)',
        AppLanguage.sindhi: 'مئي - جون (خريف)',
      },
      'harvest': {
        AppLanguage.english: '120 - 150 Days',
        AppLanguage.urdu: '120 - 150 دن',
        AppLanguage.sindhi: '120 - 150 ڏينهن',
      },
    },
    'Wheat': {
      'name': {
        AppLanguage.english: 'Wheat',
        AppLanguage.urdu: 'گندم (کنک)',
        AppLanguage.sindhi: 'ڪڻڪ',
      },
      'description': {
        AppLanguage.english: 'A staple winter crop. Thrives in moderate temperatures and well-drained soils.',
        AppLanguage.urdu: 'اہم غذائی فصل جو معتدل سردی اور زرخیز زمین میں خوب پھلتی پھولتی ہے۔',
        AppLanguage.sindhi: 'مکيه غذائي فصل جيڪا معتدل سياري ۽ زرخيز زمين ۾ بهترين ٿئي ٿي.',
      },
      'season': {
        AppLanguage.english: 'Nov - Dec (Rabi)',
        AppLanguage.urdu: 'نومبر - دسمبر (ربیع)',
        AppLanguage.sindhi: 'نومبر - ڊسمبر (ربيع)',
      },
      'harvest': {
        AppLanguage.english: '120 - 140 Days',
        AppLanguage.urdu: '120 - 140 دن',
        AppLanguage.sindhi: '120 - 140 ڏينهن',
      },
    },
    'Sugarcane': {
      'name': {
        AppLanguage.english: 'Sugarcane',
        AppLanguage.urdu: 'گنا (کماد)',
        AppLanguage.sindhi: 'ڪمند',
      },
      'description': {
        AppLanguage.english: 'A long-duration cash crop requiring fertile soil and abundant canal water.',
        AppLanguage.urdu: 'لمبی مدت کی فصل جس کے لیے زرخیز مٹی اور نہری پانی کی وافر ضرورت ہوتی ہے۔',
        AppLanguage.sindhi: 'ڊگهي مدي واري فصل جنهن لاءِ زرخيز مٽي ۽ واهن جي پاڻي جي گهڻي ضرورت پوي ٿي.',
      },
      'season': {
        AppLanguage.english: 'Feb - Mar / Sep',
        AppLanguage.urdu: 'فروری - مارچ / ستمبر',
        AppLanguage.sindhi: 'فيبروري - مارچ / سيپٽمبر',
      },
      'harvest': {
        AppLanguage.english: '10 - 12 Months',
        AppLanguage.urdu: '10 - 12 ماہ',
        AppLanguage.sindhi: '10 - 12 مهينا',
      },
    },
    'Maize (Corn)': {
      'name': {
        AppLanguage.english: 'Maize (Corn)',
        AppLanguage.urdu: 'مکئی (چھلی)',
        AppLanguage.sindhi: 'مڪئي',
      },
      'description': {
        AppLanguage.english: 'A versatile crop that requires nitrogen-rich loamy soil.',
        AppLanguage.urdu: 'نائٹروجن والی زرخیز میرا مٹی میں بہترین پیداوار دیتی ہے۔',
        AppLanguage.sindhi: 'نائٽروجن واري زرخيز ميرا مٽي ۾ سٺي پيداوار ڏيندي آهي.',
      },
      'season': {
        AppLanguage.english: 'Jul - Aug (Kharif)',
        AppLanguage.urdu: 'جولائی - اگست (خریف)',
        AppLanguage.sindhi: 'جولاءِ - آگسٽ (خريف)',
      },
      'harvest': {
        AppLanguage.english: '90 - 120 Days',
        AppLanguage.urdu: '90 - 120 دن',
        AppLanguage.sindhi: '90 - 120 ڏينهن',
      },
    },
    'Mustard (Sarson)': {
      'name': {
        AppLanguage.english: 'Mustard (Sarson)',
        AppLanguage.urdu: 'سرسوں (رائی)',
        AppLanguage.sindhi: 'سرنهن (سرسوں)',
      },
      'description': {
        AppLanguage.english: 'An oilseed winter crop requiring low water and cooler temperatures.',
        AppLanguage.urdu: 'روغنی بیجوں والی سردیوں کی فصل جسے کم پانی اور ٹھنڈے موسم کی ضرورت ہوتی ہے۔',
        AppLanguage.sindhi: 'تيل واري سياري جي فصل جنهن کي گهٽ پاڻي ۽ ٿڌي موسم گهربل هوندي آهي.',
      },
      'season': {
        AppLanguage.english: 'Oct - Nov (Rabi)',
        AppLanguage.urdu: 'اکتوبر - نومبر (ربیع)',
        AppLanguage.sindhi: 'آڪٽوبر - نومبر (ربيع)',
      },
      'harvest': {
        AppLanguage.english: '110 - 140 Days',
        AppLanguage.urdu: '110 - 140 دن',
        AppLanguage.sindhi: '110 - 140 ڏينهن',
      },
    },
    'Banana': {
      'name': {
        AppLanguage.english: 'Banana',
        AppLanguage.urdu: 'کیلا',
        AppLanguage.sindhi: 'ڪيلو',
      },
      'description': {
        AppLanguage.english: 'A highly profitable fruit crop requiring constant moisture and rich soil.',
        AppLanguage.urdu: 'منافع بخش پھل جس کے لیے نمی اور زرخیز مٹی ضروری ہے۔',
        AppLanguage.sindhi: 'فائدي وارو ميوو جنهن لاءِ آبي نمي ۽ زرخيز زمين ضروري آهي.',
      },
      'season': {
        AppLanguage.english: 'Feb - March',
        AppLanguage.urdu: 'فروری - مارچ',
        AppLanguage.sindhi: 'فيبروري - مارچ',
      },
      'harvest': {
        AppLanguage.english: '11 - 12 Months',
        AppLanguage.urdu: '11 - 12 ماہ',
        AppLanguage.sindhi: '11 - 12 مهينا',
      },
    },
    'Mung Bean (Moong)': {
      'name': {
        AppLanguage.english: 'Mung Bean (Moong)',
        AppLanguage.urdu: 'مونگ دال',
        AppLanguage.sindhi: 'مڱ (مونگ)',
      },
      'description': {
        AppLanguage.english: 'A short-duration legume that naturally fixes nitrogen in the soil.',
        AppLanguage.urdu: 'کم مدت والی دال جو قدرتی طور پر زمین کی زرخیزی بڑھاتی ہے۔',
        AppLanguage.sindhi: 'گهٽ مدي واري دال جيڪا قدرتي طور زمين جي زرخيزي وڌائي ٿي.',
      },
      'season': {
        AppLanguage.english: 'March / July',
        AppLanguage.urdu: 'مارچ / جولائی',
        AppLanguage.sindhi: 'مارچ / جولاءِ',
      },
      'harvest': {
        AppLanguage.english: '60 - 70 Days',
        AppLanguage.urdu: '60 - 70 دن',
        AppLanguage.sindhi: '60 - 70 ڏينهن',
      },
    },
    'Chilli': {
      'name': {
        AppLanguage.english: 'Chilli',
        AppLanguage.urdu: 'مرچ',
        AppLanguage.sindhi: 'مرچ',
      },
      'description': {
        AppLanguage.english: 'A high-value spice crop requiring warm weather and well-drained soil.',
        AppLanguage.urdu: 'اہم مصالحہ جاتی فصل جو گرم موسم اور نکاسی والی مٹی چاہتی ہے۔',
        AppLanguage.sindhi: 'اهم مصالحي واري فصل جيڪا گرم موسم ۽ نڪال واري مٽي پسند ڪري ٿي.',
      },
      'season': {
        AppLanguage.english: 'Feb - March',
        AppLanguage.urdu: 'فروری - مارچ',
        AppLanguage.sindhi: 'فيبروري - مارچ',
      },
      'harvest': {
        AppLanguage.english: '150 - 180 Days',
        AppLanguage.urdu: '150 - 180 دن',
        AppLanguage.sindhi: '150 - 180 ڏينهن',
      },
    },
    'Onion': {
      'name': {
        AppLanguage.english: 'Onion',
        AppLanguage.urdu: 'پیاز (گنڈا)',
        AppLanguage.sindhi: 'بصري (پياز)',
      },
      'description': {
        AppLanguage.english: 'A bulb vegetable that thrives in loose, sandy loam soils.',
        AppLanguage.urdu: 'ریتیلی اور نرم مٹی میں بہترین نشوونما پانے والی سبزی۔',
        AppLanguage.sindhi: 'ريتيلي ۽ نرم مٽي ۾ سٺي واڌ ويجهه ڪندڙ سبزي.',
      },
      'season': {
        AppLanguage.english: 'Oct - Nov',
        AppLanguage.urdu: 'اکتوبر - نومبر',
        AppLanguage.sindhi: 'آڪٽوبر - نومبر',
      },
      'harvest': {
        AppLanguage.english: '120 - 150 Days',
        AppLanguage.urdu: '120 - 150 دن',
        AppLanguage.sindhi: '120 - 150 ڏينهن',
      },
    },
    'Tomato': {
      'name': {
        AppLanguage.english: 'Tomato',
        AppLanguage.urdu: 'ٹماٹر',
        AppLanguage.sindhi: 'ٽماٽو',
      },
      'description': {
        AppLanguage.english: 'A high-demand vegetable requiring well-drained soil and good phosphorus levels.',
        AppLanguage.urdu: 'زیادہ طلب والی سبزی جسے فاسفورس اور نرم زمین کی ضرورت ہوتی ہے۔',
        AppLanguage.sindhi: 'وڌيڪ گهرج واري سبزي جنهن کي فاسفورس ۽ نرم زمين گهربل هوندي آهي.',
      },
      'season': {
        AppLanguage.english: 'Sep - Nov / Feb - Mar',
        AppLanguage.urdu: 'ستمبر - نومبر / فروری - مارچ',
        AppLanguage.sindhi: 'سيپٽمبر - نومبر / فيبروري - مارچ',
      },
      'harvest': {
        AppLanguage.english: '70 - 90 Days',
        AppLanguage.urdu: '70 - 90 دن',
        AppLanguage.sindhi: '70 - 90 ڏينهن',
      },
    },
    'Okra (Bhindi)': {
      'name': {
        AppLanguage.english: 'Okra (Bhindi)',
        AppLanguage.urdu: 'بھنڈی',
        AppLanguage.sindhi: 'ڀينڊي',
      },
      'description': {
        AppLanguage.english: 'A warm-weather vegetable crop that thrives in sandy to loamy soils.',
        AppLanguage.urdu: 'گرمیوں کی مقبول سبزی جو ریتیلی میرا مٹی میں خوب پھلتی ہے۔',
        AppLanguage.sindhi: 'گرمي جي مشهور سبزي جيڪا ريتيلي ميرا مٽي ۾ بهترين ٿئي ٿي.',
      },
      'season': {
        AppLanguage.english: 'Feb - Mar / Jun - Jul',
        AppLanguage.urdu: 'فروری - مارچ / جون - جولائی',
        AppLanguage.sindhi: 'فيبروري - مارچ / جون - جولاءِ',
      },
      'harvest': {
        AppLanguage.english: '60 - 70 Days',
        AppLanguage.urdu: '60 - 70 دن',
        AppLanguage.sindhi: '60 - 70 ڏينهن',
      },
    },
    'Eggplant (Brinjal)': {
      'name': {
        AppLanguage.english: 'Eggplant (Brinjal)',
        AppLanguage.urdu: 'بینگن',
        AppLanguage.sindhi: 'واڱڻ (بينگن)',
      },
      'description': {
        AppLanguage.english: 'A hardy vegetable crop that grows well in warm climates and rich soil.',
        AppLanguage.urdu: 'مضبوط سبزی جو گرم موسم اور زرخیز زمین میں اچھی پیداوار دیتی ہے۔',
        AppLanguage.sindhi: 'سخت سبزي جيڪا گرم موسم ۽ زرخيز زمين ۾ بهترين پيداوار ڏئي ٿي.',
      },
      'season': {
        AppLanguage.english: 'Jan - Feb / Jun - Jul',
        AppLanguage.urdu: 'جنوری - فروری / جون - جولائی',
        AppLanguage.sindhi: 'جنوري - فيبروري / جون - جولاءِ',
      },
      'harvest': {
        AppLanguage.english: '100 - 120 Days',
        AppLanguage.urdu: '100 - 120 دن',
        AppLanguage.sindhi: '100 - 120 ڏينهن',
      },
    },
  };

  /// Translates a UI key
  static String tr(String key, AppLanguage lang) {
    return _strings[key]?[lang] ?? _strings[key]?[AppLanguage.english] ?? key;
  }

  /// Translates an internal model label to a user-facing localized display name
  static String getDiseaseDisplayName(String internalLabel, AppLanguage lang) {
    final cleanLabel = internalLabel.split('|')[0].trim();
    return _diseaseDisplayNames[cleanLabel]?[lang] ??
        _diseaseDisplayNames[cleanLabel]?[AppLanguage.english] ??
        cleanLabel.replaceAll('_', ' ');
  }

  /// Translates clinical cause
  static String getDiseaseCause(String internalLabel, AppLanguage lang) {
    final cleanLabel = internalLabel.split('|')[0].trim();
    return _diseaseClinicalInfo[cleanLabel]?['cause']?[lang] ??
        _diseaseClinicalInfo[cleanLabel]?['cause']?[AppLanguage.english] ??
        'Unknown Cause';
  }

  /// Translates clinical cure
  static String getDiseaseCure(String internalLabel, AppLanguage lang) {
    final cleanLabel = internalLabel.split('|')[0].trim();
    return _diseaseClinicalInfo[cleanLabel]?['cure']?[lang] ??
        _diseaseClinicalInfo[cleanLabel]?['cure']?[AppLanguage.english] ??
        'No Cure Specified';
  }

  /// Translates crop name
  static String getCropName(String englishCropName, AppLanguage lang) {
    return _cropTranslations[englishCropName]?['name']?[lang] ??
        _cropTranslations[englishCropName]?['name']?[AppLanguage.english] ??
        englishCropName;
  }

  /// Translates crop description
  static String getCropDescription(String englishCropName, AppLanguage lang) {
    return _cropTranslations[englishCropName]?['description']?[lang] ??
        _cropTranslations[englishCropName]?['description']?[AppLanguage.english] ??
        '';
  }

  /// Translates crop sowing season
  static String getCropSeason(String englishCropName, AppLanguage lang) {
    return _cropTranslations[englishCropName]?['season']?[lang] ??
        _cropTranslations[englishCropName]?['season']?[AppLanguage.english] ??
        '';
  }

  /// Translates crop harvest time
  static String getCropHarvestTime(String englishCropName, AppLanguage lang) {
    return _cropTranslations[englishCropName]?['harvest']?[lang] ??
        _cropTranslations[englishCropName]?['harvest']?[AppLanguage.english] ??
        '';
  }
}
