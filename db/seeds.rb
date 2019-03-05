# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Job.destroy_all
User.destroy_all
Position.destroy_all
Category.destroy_all

JOB_AREA = ["תל אביב והמרכז", "ירושלים וסביבותיה", "הצפון, חיפה והקריות", "אזור השרון", "השפלה ודרום הארץ", "אילת והערבה"]

HOTEL = ["אחראי/ת משמרת",
         "פקיד/ת  קבלה",
         "דור מן/ית",
         "חדרן/ית",
         "מוכר/ת",
         "מזכיר/ה",
         "מטפל/ת ספא",
         "מנהל/ת אירועים",
         "מנהל/ת חדר אוכל",
         "מנהל/ת לובי",
         "מציל/ה",
         "מתאמ/ת",
         "מתאמ/ת קבוצות",
         "קבט/ית",
         "קונסיארג'/ית",
         "קופאי/ת",
         "קניין/ת",
         "רסיבר/ית" ]

KITCHEN = [
  "אופה",
  "איש/ת לחם",
  "גלידן/ית",
  "גרילמן/ית",
  "טבח/ית",
  "מנהל/ת מטבח",
  "סו שף/ית",
  "סו שף/ית קונדיטור",
  "עוזר טבח/ית",
  "צ'קר/ית",
  "קונדיטור/ית",
  "קניין/ת",
  "קצב/ית",
  "שוקולטייר/ית",
  "שף/ית",
"שף/ית קונדיטור"]

SERVICE = [
  "אחראי/ת משמרת",
  "בריסטה",
  "ברמן/ית",
  "מארח/ת",
  "מלצר/ית",
  "מנהל/ת",
  "מנהל/ת אירועים",
  "מנהל/ת תחנה",
  "סגן/ית מנהל/ת",
  "עובד/ת דלפק",
"קופאי/ת"]

MANAGEMENT = [
  'יועץ/ת עיסקי',
  'מנהל/ת',
  'מנהל/ת חשבונות',
  'מנהל/ת כספים',
  'מנהל/ת מזומ"ש',
  'מנהל/ת רכש',
  'מנכ"ל/ית',
  'סגן מנהל/ת כספים',
  'סגן מנהל/ת מזומ"ש',
  'סמנכ"ל/ית',
  'פקיד/ת',
  'רואה/ת חשבון',
  'סגן/ית מנהל/ת'
]

GENERAL = ["אינסטלטור/ית",
           "חשמלאי/ת",
           "מחסנאי/ת",
           "מטפל/ת",
           "נהג/ת",
           "עובד/ת אחזקה",
           "עובד/ת כללי",
           "עובד/ת משק",
           "עובד/ת נקיון",
           "שוטף/ת כלים",
           "עוזר/ת"]


hotel = Category.create!(
  {
    name: "Hotel",
    hebrew: "אירוח"
})

kitchen = Category.create!(
  {
    name: "Kitchen",
    hebrew: "מטבח"
})

general = Category.create!(
  {
    name: "General",
    hebrew: "כלליים"
})

management = Category.create!(
  {
    name: "Management",
    hebrew: "ניהול"
})

service = Category.create!(
  {
    name: "Service",
    hebrew: "שירות"
})

HOTEL.each do |name|
  Position.create!(name: name, category_id: hotel.id)
end

KITCHEN.each do |name|
  Position.create!(name: name, category_id: kitchen.id)
end

SERVICE.each do |name|
  Position.create!(name: name, category_id: service.id)
end

MANAGEMENT.each do |name|
  Position.create!(name: name, category_id: management.id)
end

GENERAL.each do |name|
  Position.create!(name: name, category_id: general.id)
end

user = User.new(
  id: 2,
  name: "Daniel Kol",
  email: "daniel@example.com",
  password: "asdasd",
  password_confirmation: "asdasd"
)
user.save!

5.times do
  Job.create!([
                {
                  title: "AMIIIIIR",
                  description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
                  position_id: Position.find_by_name("#{MANAGEMENT.sample}").id,
                  location: JOB_AREA.sample,
                  job_author: "ארומה",
                  state: 1,
                  user_id: user.id,
                  avatar: Rails.root.join("app/assets/images/facebook.jpg").open
                },
                {
                  title: "משווק",
                  description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
                  position_id: Position.find_by_name("#{HOTEL.sample}").id,
                  location: JOB_AREA.sample,
                  job_author: "קפה נואר",
                  state: 1,
                  user_id: user.id,
                  avatar: Rails.root.join("app/assets/images/slack.jpg").open
                },
                {
                  title: "שוטף כלים",
                  description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
                  position_id: Position.find_by_name("#{GENERAL.sample}").id,
                  location: JOB_AREA.sample,
                  job_author: "ארומה",
                  state: 1,
                  user_id: user.id,
                  avatar: Rails.root.join("app/assets/images/trello.jpg").open
                },
                {
                  title: "מארחת",
                  description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
                  position_id: Position.find_by_name("#{SERVICE.sample}").id,
                  location: JOB_AREA.sample,
                  job_author: "אמורה מיו",
                  state: 1,
                  user_id: user.id,
                  avatar: Rails.root.join("app/assets/images/wordpress.jpg").open
                },
                {
                  title: "מלצר",
                  description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
                  position_id: Position.find_by_name("#{KITCHEN.sample}").id,
                  location: JOB_AREA.sample,
                  job_author: "ג'פניקה",
                  state: 1,
                  user_id: user.id,
                  avatar: Rails.root.join("app/assets/images/basecamp.jpg").open
                }
  ])
end



# Job.create!([{
#                title: "AMIIIIIR",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "ייעוץ, מכירות ושיווק",
#                position_id:
#                location: "תל אביב והמרכז",
#                job_author: "ארומה",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/facebook.jpg").open
#              },
#              {
#                title: "משווק",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות כלליים",
#                position_id:
#                location: "אילת והערבה",
#                job_author: "קפה נואר",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/slack.jpg").open
#              },
#              {
#                title: "שוטף כלים",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות המטבח",
#                position_id:
#                location: "אזור השרון",
#                job_author: "ארומה",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/trello.jpg").open
#              },
#              {
#                title: "מארחת",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות כלליים",
#                position_id:
#                location: "תל אביב והמרכז",
#                job_author: "אמורה מיו",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/wordpress.jpg").open
#              },
#              {
#                title: "מלצר",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "ייעוץ, מכירות ושיווק",
#                position_id:
#                location: "השפלה ודרום הארץ",
#                job_author: "ג'פניקה",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/basecamp.jpg").open
#              },
#              {
#                title: "טבח",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "ייעוץ, מכירות ושיווק",
#                position_id:
#                location: "ירושלים וסביבותיה",
#                job_author: "דיקסי",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/twitter.jpg").open
#              },
#              {
#                title: "מלצר",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות כלליים",
#                position_id:
#                location: "תל אביב והמרכז",
#                job_author: "בלאק",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/web-crunch.jpg").open
#              },
#              {
#                title: "משווק",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות שירות ואירוח",
#                position_id:
#                location: "הצפון, חיפה והקריות",
#                job_author: "קפה נואר",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/slack.jpg").open
#              },
#              {
#                title: "שוטף כלים",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות המטבח",
#                position_id:
#                location: "השפלה ודרום הארץ",
#                job_author: "ארומה",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/trello.jpg").open
#              },
#              {
#                title: "מארחת",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות המטבח",
#                position_id:
#                location: "תל אביב והמרכז",
#                job_author: "אמורה מיו",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/wordpress.jpg").open
#              },
#              {
#                title: "מלצר",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות שירות ואירוח",
#                position_id:
#                location: "אזור השרון",
#                job_author: "ג'פניקה",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/basecamp.jpg").open
#              },
#              {
#                title: "טבח",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות כלליים",
#                position_id:
#                location: "אזור השרון",
#                job_author: "דיקסי",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/twitter.jpg").open
#              },
#              {
#                title: "מלצר",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות כלליים",
#                position_id:
#                location: "תל אביב והמרכז",
#                job_author: "בלאק",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/web-crunch.jpg").open
#              },
#              {
#                title: "משווק",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות ניהול ומנהלה",
#                position_id:
#                location: "הצפון, חיפה והקריות",
#                job_author: "קפה נואר",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/slack.jpg").open
#              },
#              {
#                title: "שוטף כלים",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות ניהול ומנהלה",
#                position_id:
#                location: "השפלה ודרום הארץ",
#                job_author: "ארומה",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/trello.jpg").open
#              },
#              {
#                title: "מארחת",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות המטבח",
#                position_id:
#                location: "תל אביב והמרכז",
#                job_author: "אמורה מיו",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/wordpress.jpg").open
#              },
#              {
#                title: "מלצר",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות המטבח",
#                position_id:
#                location: "ירושלים וסביבותיה",
#                job_author: "ג'פניקה",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/basecamp.jpg").open
#              },
#              {
#                title: "טבח",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "ייעוץ, מכירות ושיווק",
#                position_id:
#                location: "ירושלים וסביבותיה",
#                job_author: "דיקסי",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/twitter.jpg").open
#              },
#              {
#                title: "מלצר",
#                description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
#                job_type: "מקצועות שירות ואירוח",
#                position_id:
#                location: "תל אביב והמרכז",
#                job_author: "בלאק",
#                state: 1,
#                user_id: user.id,
#                avatar: Rails.root.join("app/assets/images/web-crunch.jpg").open
#              }
#              ])
