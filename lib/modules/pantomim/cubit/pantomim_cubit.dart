import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pantomim_state.dart';

class PantomimCubit extends Cubit<String> {
  PantomimCubit() : super("");
  String wordrand = "";
  final List<String> words = [
    "توسعه‌دهنده محتوا",
    "تحلیلگر محتوا",
    "مدیر شناختی",
    "مدیر اصولی",
    "پژوهشگر معتبر",
    "مدیر برنامه‌ریزی آموزشی",
    "تحلیلگر اجتماعی",
    "مدیر وب",
    "ناظر آموزشی",
    "مدیر کارآفرینی",
    "گزارشگر اجتماعی",
    "توسعه‌دهنده فنی",
    "سرآشپز",
    "آب‌پاش",
    "ناوشکن",
    "خلبان",
    "مهندسی",
    "فنجان‌دار",
    "دستفروش",
    "ستاره‌شناس",
    "ماراتون",
    "خودپرداز",
    "نقاشی",
    "تاکسیدرمی",
    "گل‌آرایی",
    "آفتاب‌پرست",
    "آشپزی",
    "مجری",
    "کارواش",
    "پازل",
    "سیاه‌مشق",
    "انیماتور",
    "قاصدک",
    "دکوراسیون",
    "بازرس",
    "خمیازه",
    "مهدکودک",
    "هلیکوپتر",
    "عروسک‌ساز",
    "شمعدان",
    "مجسمه‌سازی",
    "توت‌فرنگی",
    "هنرپیشه",
    "بستنی‌فروش",
    "کاوشگر",
    "صخره‌نورد",
    "قارچ‌شناس",
    "کیک‌پز",
    "کف‌باز",
    "نوازنده",
    "عکاسی",
    "نگهبان",
    "دوربین‌دار",
    "نانوایی",
    "ویراستار",
    "دماسنج",
    "کاشف",
    "کارگردان",
    "نجار",
    "کارتون‌ساز",
    "برج‌ساز",
    "بال‌نواز",
    "گیاه‌پزشک",
    "سیاره‌شناس",
    "دانشجو",
    "گچ‌کار",
    "موزه‌دار",
    "آتش‌نشان",
    "شیشه‌گر",
    "پرستار",
    "ژیمناستیک",
    "آزمایشگاه",
    "فیلم‌نامه‌نویس",
    "بازیگر",
    "ماجراجو",
    "آکروبات",
    "بندرگاه",
    "کتابدار",
    "آهنگ‌ساز",
    "طراح مد",
    "سوارکار",
    "مکانیک",
    "زنجیرچرخ",
    "قالیباف",
    "کاردستی",
    "کلیددار",
    "خرس قطبی",
    "بالن‌سواری",
    "دریانورد",
    "ناخدا",
    "جواهرساز",
    "نوازنده فلوت",
    "دکمه‌دوز",
    "گلخانه‌دار",
    "پیچ‌گوشتی",
    "سفالگر",
    "سنگ‌تراش",
    "کتاب‌خوان",
    "کشاورز",
    "باغبان",
    "قصاب",
    "پزشک",
    "دندانپزشک",
    "بوم‌شناس",
    "راه‌آهن",
    "کوهنورد",
    "مخترع",
    "آبرنگ",
    "مجسمه‌ساز",
    "روانشناس",
    "دندان‌ساز",
    "ویترینیست",
    "مدیر فروش",
    "اتوبوس",
    "رنگ‌ساز",
    "سخنران",
    "فیلم‌بردار",
    "کفش‌دوز",
    "میکروب‌شناس",
    "ماهیگیر",
    "کلیدساز",
    "لاک‌پشت",
    "لوله‌کش",
    "شیرینی‌پز",
    "کاریکاتوریست",
    "فیل‌سوار",
    "رنگ‌آمیز",
    "مربی ورزشی",
    "دانشمند",
    "مورچه‌خوار",
    "کتاب‌نویس",
    "پشه‌باز",
    "تاکسی‌ران",
    "قصه‌گو",
    "پژوهشگر",
    "مهتاب",
    "آسمان‌خراش",
    "قالی‌شور",
    "مداد تراش",
    "پیشنهاد دهنده",
    "جراح",
    "ماساژور",
    "فرهنگ‌نویس",
    "قصه‌پرداز",
    "کماندو",
    "خوش‌نویس",
    "جهانگرد",
    "بافنده",
    "گلدوز",
    "چای‌فروش",
    "کفاش",
    "شعبده‌باز",
    "ناظم",
    "کوهنورد",
    "نازک‌دوز",
    "ناخن‌کار",
    "پاستا ساز",
    "پزشک قلب",
    "بیابان‌گرد",
    "کارآگاه",
    "پرچم‌دار",
    "نجوم‌شناس",
    "زبان‌شناس",
    "بازی‌ساز",
    "چشم‌پزشک",
    "دوربین‌چی",
    "کتاب‌شناس",
    "کف‌زن",
    "محیط‌بان",
    "گوهر‌شناس",
    "خوش‌پوش",
    "فوتبالیست",
    "چراغ‌دار",
    "حسابدار",
    "پرسپولیسی",
    "نقاش",
    "شکارچی",
    "کالسکه‌ران",
    "معلم",
    "آژانس‌دار",
    "پناهگاه‌دار",
    "کلکسیون‌دار",
    "رستوران‌دار",
    "بازرگان",
    "طبیعت‌گرد",
    "جغرافی‌دان",
    "زبان‌باز",
    "فیلسوف",
    "کاشی‌ساز",
    "کمپ‌زن",
    "قطاربان",
    "سرمایه‌گذار",
    "بوفه‌دار",
    "غریق‌نجات",
    "بال‌پوش",
    "پرستار حیوانات",
    "سنگ‌شناس",
    "پرچم‌دار",
    "مهره‌ساز",
    "عینک‌ساز",
    "هنرپیشه عروسکی",
    "طراح داخلی",
    "گچ‌بر",
    "گازران",
    "ابریشم‌دوز",
    "محله‌باز",
    "شب‌گرد",
    "بوم‌ساز",
    "دیوار‌نگار",
    "طراح پوستر",
    "مربی یوگا",
    "جادوگر",
    "چرخ‌ساز",
    "گل‌چین",
    "پزشک ارتوپد",
    "کارت‌باز",
    "قالی‌نویس",
    "پاپیون‌زن",
    "چسب‌کار",
    "سوارکار اسب",
    "دستیار",
    "شکارچی",
    "قند‌شکن",
    "چنگ‌زن",
    "عکاس خبری",
    "نیمکت‌ساز",
    "نوازنده ترومپت",
    "میکروب‌شناس آب",
    "آهنگ‌نویس",
    "یخ‌چال‌ساز",
    "نقاش کشتی",
    "مجسمه‌ساز چوب",
    "کمان‌کش",
    "آب‌شناس",
    "بیل‌زن",
    "تار‌نواز",
    "استاد بزرگ شطرنج",
    "گل‌فروش",
    "آرایشگر",
    "نگهبان مرز",
    "کف‌باز ورزش",
    "هواشناس",
    "شیشه‌ساز",
    "جادوگر سیاه",
    "آشپز درباری",
    "مهندسی فناوری",
    "تحلیل‌گر داده",
    "پژوهشگر زمین‌شناسی",
    "سفال‌پز",
    "موسیقی‌دان کلاسیک",
    "پرورش‌دهنده طیور",
    "کارشناس بیمه",
    "پلیس",
    "بیمار‌یاب",
    "پزشک اورژانس",
    "فوق‌لیسانس",
    "دوچرخه‌سوار",
    "سگ‌دار",
    "گنج‌کاو",
    "خاک‌شناس",
    "پیشگو",
    "کدبانو",
    "تجزیه‌کار",
    "کفش‌فروش",
    "مربی شنا",
    "خوابگرد",
    "رئیس‌جمهور",
    "نفت‌کش",
    "کماندار",
    "مخترع",
    "قطعات‌کار",
    "گلابی‌کار",
    "فنی‌کار",
    "چشم‌چران",
    "صدای‌خوان",
    "سم‌پاش",
    "زنبور‌دار",
    "کارگر",
    "ابریشم‌کار",
    "آتش‌فشان‌کاو",
    "کوه‌نورد",
    "چاقوساز",
    "فراست‌گیر",
    "کشاورز گلابی",
    "پرورش‌دهنده گل",
    "دستیار هنرمند",
    "آب‌پز",
    "تصفیه‌گر",
    "سنگ‌تراش",
    "لجن‌کار",
    "کارگر مهاجر",
    "نقاش چهره",
    "عکاس سیاه‌سفید",
    "پول‌ساز",
    "تاجر",
    "سازنده دکور",
    "لوازم‌فروشی",
    "لک‌زن",
    "مسیرساز",
    "بزرگ‌زن",
    "بوسه‌زن",
    "گل‌چینی",
    "سفرنامه‌نویس",
    "پیشخدمت",
    "شیرینی‌ساز",
    "سازنده موسیقی",
    "خوشنویس",
    "سنجش‌گر",
    "نوازنده سازهای سنتی",
    "کارشناس توسعه",
    "کسی‌کار",
    "کشاورز ارگانیک",
    "ناخدا",
    "کلاسیک‌خوان",
    "کارشناس معماری",
    "دیزل‌ساز",
    "نقاش طبیعی",
    "خواب‌آور",
    "تاریک‌خانه‌دار",
    "تاریخ‌نگار",
    "کودک‌شناس",
    "دوست‌داران طبیعت",
    "ستاره‌بین",
    "فوتبال‌دوست",
    "تحلیلگر داده‌های بزرگ",
    "مشاور استراتژیک",
    "مدیر تحصیلی",
    "کارشناس تحلیل",
    "کارشناس استراتژی",
    "مدیر تحقیق و توسعه",
    "مدیر مالی",
    "مدیر پروژه‌های اجتماعی",
    "مدیر روابط‌عمومی",
    "مدیر گرافیک",
    "مدیر بازاریابی دیجیتال",
    "پژوهشگر علمی",
    "کارشناس فناوری",
    "پژوهشگر اجتماعی",
    "مشاور آموزشی",
    "مدیر منابع انسانی",
    "مدیر یادگیری",
    "مدیر مجازی",
    "توسعه‌دهنده تجاری",
    "کارشناس فرآیند",
    "مدیر نوآوری",
    "مدیر پرورش استعدادها",
    "تحلیلگر پروژه",
    "تحلیلگر ارتباطات",
    "مدیر برنامه‌های تحصیلی",
    "کارشناس رسانه",
    "مدیر استراتژی بازاریابی",
    "مدیر تعامل اجتماعی",
    "مدیر تحصیلات عالی",
    "تحلیلگر کیفی",
    "مدیر امور اجتماعی",
    "کارشناس نوآوری",
    "مدیر تحلیل اجتماعی",
    "مشاور آموزش",
    "مدیر پژوهش و تحلیل",
    "مدیر علمی",
    "تحلیلگر انسانی",
    "مدیر محتوای دیجیتال",
    "مدیر نوآوری آموزشی",
    "مدیر برنامه‌ریزی استراتژیک",
    "مدیر فرایندهای آموزشی",
    "مدیر یادگیری اجتماعی",
    "تحلیلگر تحول",
    "مدیر راهکارهای اجتماعی",
    "مدیر نوآوری‌های آموزشی",
    "کارشناس بین‌المللی",
    "مدیر نوآوری مالی",
    "مدیر توسعه تجاری",
    "مدیر ایده‌ها",
    "مدیر اجرا",
    "مدیر توسعه پایدار",
    "تحلیلگر اقتصادی",
    "مدیر پروژه‌های بین‌المللی",
    "مدیر خلاقیت آموزشی",
    "تحلیلگر منابع انسانی",
    "مدیر برند",
    "تحلیلگر پروژه‌های اجتماعی",
    "مدیر آموزش و پرورش",
    "مدیر تحصیلات عمومی",
    "مدیر نوآوری استراتژیک",
    "مدیر انتشارات",
    "کارشناس علمی",
    "مدیر خدمات آموزشی",
    "کارشناس محتوایی",
    "مدیر تحولات اجتماعی",
    "تحلیلگر سیستم‌های آموزشی",
    "مدیر برنامه‌های تحصیلی",
    "تحلیلگر فرهنگی",
    "مدیر تحقیق و توسعه",
    "کارشناس تحول اجتماعی",
    "مدیر پروژه‌های نوآوری",
    "مدیر ارتباطات اجتماعی",
    "مدیر پروژه‌های خلاق",
    "مدیر پژوهش و توسعه",
    "مدیر استراتژی‌های آموزشی",
    "مدیر محتوای اجتماعی",
    "تحلیلگر برنامه‌ریزی",
    "مدیر منابع مالی",
    "مدیر ایجاد محتوای دیجیتال",
    "تحلیلگر عملکرد",
    "مدیر مشاوره",
    "مدیر علوم اجتماعی",
    "مدیر نوآوری‌های مالی",
    "کارشناس نوآوری‌های اجتماعی",
    "مدیر آموزشی",
    "تحلیلگر آینده‌پژوهی",
    "مدیر پیشرفت‌های اجتماعی",
    "مدیر نوآوری علمی",
    "تحلیلگر اجتماعی",
    "مدیر محتوای علمی",
    "مدیر امور انسانی",
    "مدیر پژوهش‌های بین‌المللی",
    "مدیر خدمات اجتماعی",
    "مدیر طرح‌های نوآوری",
    "مدیر برندینگ",
    "مدیر علمی و پژوهشی",
    "مدیر پروژه‌های بین‌المللی",
    "تحلیلگر استراتژیک",
    "مدیر یادگیری دیجیتال",
    "تحلیلگر نوآوری",
    "مدیر خلاقیت‌های اجتماعی",
    "مدیر تحصیلات دانشگاهی",
    "مدیر پروژه‌های خلاقانه",
    "مدیر آموزش و یادگیری",
    "تحلیلگر روندها",
    "مدیر پشتیبانی اجتماعی",
    "تحلیلگر سیستم‌های اجتماعی",
    "مدیر جامعه‌محور",
    "تحلیلگر انتقادی",
    "مدیر راهکارهای آموزشی",
    "تحلیلگر پژوهشی",
    "مدیر زیرساخت‌های آموزشی",
    "مدیر نوآوری اجتماعی",
    "مدیر خلاقیت‌های آموزشی",
    "مدیر توسعه اجتماعی",
    "تحلیلگر روابط اجتماعی",
    "مدیر مشاوره تحصیلی",
    "تحلیلگر فرهنگی-اجتماعی",
    "مدیر پروژه‌های پژوهشی",
    "مدیر مدیریت پروژه‌های نوآورانه",
    "مدیر طرح‌های تحصیلی",
    "مدیر نوآوری آموزشی",
    "مدیر علوم انسانی",
    "تحلیلگر اجتماعی",
    "مدیر آینده‌نگری",
    "مدیر ارزیابی اجتماعی",
    "مدیر زیرساخت‌های انسانی",
    "مدیر پشتیبانی آموزشی",
    "تحلیلگر محتوای آموزشی",
    "مدیر خلاقیت اجتماعی",
    "مدیر برنامه‌های اجتماعی",
    "تحلیلگر استراتژیک اجتماعی",
    "مدیر فناوری آموزشی",
    "مدیر پشتیبانی تحصیلی",
    "مدیر مدیریت محتوای اجتماعی",
    "تحلیلگر پژوهش‌های اجتماعی",
    "مدیر برنامه‌ریزی تحصیلی",
    "مدیر مشاوره تحصیلی",
    "تحلیلگر بازار",
    "مدیر ریسک‌های اجتماعی",
    "مدیر تحولات آموزشی",
    "تحلیلگر اجتماعی و اقتصادی",
    "مدیر ارزیابی",
    "مدیر ارتباطات آموزشی",
    "تحلیلگر محتوای اجتماعی",
    "مدیر آموزش عمومی",
    "تحلیلگر رویدادهای اجتماعی",
    "مدیر نوآوری‌های اجتماعی",
    "مدیر آموزش و پرورش عمومی",
    "تحلیلگر روندهای اجتماعی",
    "مدیر پروژه‌های خلاقانه",
    "مدیر مشاوره آموزشی",
    "مدیر طرح‌های تحصیلی",
    "تحلیلگر برون‌مرزی",
    "مدیر برند اجتماعی",
    "مدیر تحقیقاتی",
    "تحلیلگر مقایسه‌ای",
    "مدیر خدمات بهداشتی",
    "مدیر تحقیقات اجتماعی",
    "مدیر مدیریت اجتماعی",
    "تحلیلگر رفتار اجتماعی",
    "مدیر نوآوری در آموزش",
    "مدیر نوآوری اجتماعی",
    "تحلیلگر متدولوژی",
    "مدیر رویکردهای آموزشی",
    "مدیر روابط اجتماعی",
    "تحلیلگر تکنیک‌های آموزشی",
    "مدیر نوآوری‌های اجتماعی",
    "مدیر کارآفرینی اجتماعی",
    "تحلیلگر علوم اجتماعی",
    "مدیر خلاقیت و نوآوری",
    "تحلیلگر تأثیرات اجتماعی",
    "مدیر پروژه‌های اجتماعی",
    "مدیر فرایندهای اجتماعی",
    "تحلیلگر مداخله‌های اجتماعی",
    "مدیر نوآوری‌های نوین",
    "تحلیلگر اجتماعی و فرهنگی",
    "مدیر ارزیابی علمی",
    "مدیر برنامه‌های پژوهشی",
    "تحلیلگر روش‌های اجتماعی",
    "مدیر پروژه‌های تحصیلی",
    "مدیر نوآوری و خلاقیت",
    "مدیر آموزش تخصصی",
    "تحلیلگر عوامل اجتماعی",
    "مدیر نوآوری در خدمات آموزشی",
    "مدیر روش‌های آموزشی",
    "تحلیلگر خلاقیت اجتماعی",
    "مدیر پروژه‌های نوآوری",
    "تحلیلگر نتایج آموزشی",
    "مدیر نوآوری‌های علمی",
    "مدیر خدمات آموزشی",
    "تحلیلگر تطبیقی",
    "مدیر تحقیقات انسانی",
    "مدیر خلاقیت در آموزش",
    "تحلیلگر محتوای انسانی",
    "مدیر توسعه و نوآوری",
    "مدیر ارتباطات اجتماعی",
    "مدیر نوآوری آموزشی",
    "مدیر طرح‌های پژوهشی",
    "تحلیلگر وضعیت اجتماعی",
    "مدیر سرمایه‌گذاری اجتماعی",
    "مدیر استراتژی اجتماعی",
    "مدیر داده‌های اجتماعی",
    "مدیر راهبردهای اجتماعی",
    "تحلیلگر خدمات آموزشی",
    "مدیر نوآوری و توسعه",
    "مدیر پروژه‌های نوآورانه",
    "تحلیلگر پروژه‌های آموزشی",
    "مدیر استراتژی‌های اجتماعی",
    "تحلیلگر کارکردهای اجتماعی",
    "مدیر مدیریت تغییر",
    "تحلیلگر روندهای نوآوری",
    "مدیر مشاوره در علوم اجتماعی",
    "مدیر پژوهش‌های اجتماعی",
    "مدیر نهادهای اجتماعی",
    "تحلیلگر محیط اجتماعی",
    "مدیر استراتژی‌های نوآوری",
    "تحلیلگر رویکردهای نوین",
    "مدیر نوآوری‌های آموزشی",
    "مدیر خدمات بهداشتی",
    "تحلیلگر جامعه‌شناسی",
    "مدیر پروژه‌های خلاقانه",
    "مدیر ارزیابی اجتماعی",
    "تحلیلگر تأثیرات اجتماعی",
    "مدیر پروژه‌های پژوهشی",
    "مدیر تعامل اجتماعی",
    "تحلیلگر محتوا",
    "مدیر نوآوری و تحول",
    "مدیر بررسی‌های اجتماعی",
    "تحلیلگر متدولوژی‌های آموزشی",
    "مدیر روش‌های اجتماعی",
    "مدیر تحقیقات اجتماعی",
    "تحلیلگر رفتار انسانی",
    "مدیر خدمات اجتماعی",
    "مدیر تحصیلات تخصصی",
    "مدیر برنامه‌ریزی اجتماعی",
    "تحلیلگر مقایسه‌ای",
    "مدیر نوآوری‌های آموزشی",
    "مدیر خلاقیت اجتماعی",
    "تحلیلگر سیستم‌های اجتماعی",
    "مدیر آموزش و پرورش عمومی",
    "مدیر تحقیقات انسانی",
    "تحلیلگر روش‌های آموزشی",
    "مدیر نوآوری اجتماعی",
    "مدیر خلاقیت و نوآوری",
    "مدیر نوآوری در آموزش",
    "تحلیلگر استراتژی‌های اجتماعی",
    "مدیر خدمات آموزشی",
    "تحلیلگر رویکردهای آموزشی",
    "مدیر روش‌های آموزشی",
    "تحلیلگر نگرش‌های اجتماعی",
    "مدیر نوآوری و تحول اجتماعی",
    "تحلیلگر پروژه‌های اجتماعی",
    "مدیر خلاقیت اجتماعی",
    "مدیر پژوهش‌های اجتماعی",
    "تحلیلگر کارکردهای اجتماعی",
    "مدیر پروژه‌های نوآوری",
    "مدیر رویکردهای آموزشی",
    "تحلیلگر وضعیت اجتماعی",
    "مدیر نوآوری و خلاقیت",
    "مدیر خدمات بهداشتی",
    "تحلیلگر تأثیرات اجتماعی",
    "مدیر نوآوری در علوم انسانی",
    "مدیر پروژه‌های تحصیلی",
    "تحلیلگر تأثیرات آموزشی",
    "مدیر خدمات اجتماعی",
    "مدیر پروژه‌های تحقیقاتی",
    "تحلیلگر رفتار اجتماعی",
    "مدیر نوآوری و خلاقیت",
    "مدیر مشاوره اجتماعی",
    "مدیر خلاقیت در آموزش",
    "تحلیلگر روش‌های اجتماعی",
    "مدیر تحقیقات انسانی",
    "مدیر توسعه اجتماعی",
    "تحلیلگر تعاملات اجتماعی",
    "مدیر نوآوری‌های اجتماعی",
    "مدیر مشاوره در علوم انسانی",
    "مدیر تحقیقات اجتماعی",
    "تحلیلگر روش‌های آموزشی",
    "مدیر نوآوری در خدمات آموزشی",
    "مدیر خلاقیت اجتماعی",
    "مدیر تحصیلات تخصصی",
    "تحلیلگر مقایسه‌ای",
    "مدیر نوآوری و خلاقیت",
    "مدیر پروژه‌های خلاقانه",
    "تحلیلگر روش‌های نوین",
    "مدیر مشاوره اجتماعی",
    "مدیر نوآوری اجتماعی",
    "مدیر پروژه‌های پژوهشی",
    "تحلیلگر اجتماعی و فرهنگی",
    "مدیر نوآوری‌های نوین",
    "مدیر خدمات بهداشتی",
    "تحلیلگر رفتار اجتماعی",
    "مدیر نوآوری و تحول اجتماعی",
    "مدیر پروژه‌های اجتماعی",
    "تحلیلگر تأثیرات اجتماعی",
    "مدیر نوآوری و خلاقیت",
    "مدیر توسعه اجتماعی",
    "تحلیلگر پروژه‌های آموزشی",
    "مدیر مشاوره آموزشی",
    "تحلیلگر مقایسه‌ای",
    "مدیر نوآوری‌های اجتماعی",
    "مدیر پژوهش‌های انسانی",
    "تحلیلگر وضعیت اجتماعی",
    "مدیر پروژه‌های نوآورانه",
    "مدیر نوآوری اجتماعی",
    "مدیر خدمات اجتماعی",
    "تحلیلگر تأثیرات آموزشی",
    "مدیر پروژه‌های پژوهشی",
    "مدیر نوآوری و خلاقیت",
    "مدیر مشاوره اجتماعی",
    "تحلیلگر روندهای اجتماعی",
    "مدیر پژوهش‌های اجتماعی",
    "مدیر خلاقیت اجتماعی",
    "مدیر پروژه‌های نوآورانه",
    "تحلیلگر پروژه‌های آموزشی",
    "مدیر نوآوری و تحول اجتماعی",
    "مدیر خدمات بهداشتی",
    "تحلیلگر رفتار اجتماعی",
    "مدیر نوآوری اجتماعی",
    "مدیر نوآوری‌های اجتماعی",
    "تحلیلگر نتایج آموزشی",
    "مدیر نوآوری در خدمات آموزشی",
    "مدیر نوآوری‌های اجتماعی",
    "مدیر مشاوره در علوم اجتماعی",
    "تحلیلگر نوآوری اجتماعی",
  ];

  generateRandomWord() {
    final randomIndex = Random().nextInt(words.length);
    wordrand = words[randomIndex];
    emit(words[randomIndex]);
    emit(wordrand);
    print(wordrand);
  }
}
