# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Job.destroy_all
User.destroy_all
Categories.destroy_all
Positions.destroy_all


sales = Category.create!(
{
  name: "Sales"
})

kitchen = Category.create!(
{
  name: "Kitchen"
})

general = Category.create!(
{
  name: "General"
})

management = Category.create!(
{
  name: "Management"
})

service = Category.create!(
{
  name: "Service"
})



positions.each do |name, category|
  Position.create!(name: name, category_id: category)
end

Position.create!([{
                    name: "waiter"
                    category_id: 2
                  },
                  {
                    name: "cook"
                  },
                  {
                    name: "General"
                  },
                  {
                    name: "Management"
                  },
                  {
                    name: "Service"
                  }
                  ])

user = User.new(
  id: 2,
  name: "Daniel Kol",
  email: "daniel@example.com",
  password: "asdasd",
  password_confirmation: "asdasd"
)
user.save!

Job.create!([{
               title: "AMIIIIIR",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "ייעוץ, מכירות ושיווק",
               location: "תל אביב והמרכז",
               job_author: "ארומה",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/facebook.jpg").open
             },
             {
               title: "משווק",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות כלליים",
               location: "אילת והערבה",
               job_author: "קפה נואר",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/slack.jpg").open
             },
             {
               title: "שוטף כלים",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות המטבח",
               location: "אזור השרון",
               job_author: "ארומה",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/trello.jpg").open
             },
             {
               title: "מארחת",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות כלליים",
               location: "תל אביב והמרכז",
               job_author: "אמורה מיו",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/wordpress.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "ייעוץ, מכירות ושיווק",
               location: "השפלה ודרום הארץ",
               job_author: "ג'פניקה",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/basecamp.jpg").open
             },
             {
               title: "טבח",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "ייעוץ, מכירות ושיווק",
               location: "ירושלים וסביבותיה",
               job_author: "דיקסי",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/twitter.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות כלליים",
               location: "תל אביב והמרכז",
               job_author: "בלאק",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/web-crunch.jpg").open
             },
             {
               title: "משווק",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות שירות ואירוח",
               location: "הצפון, חיפה והקריות",
               job_author: "קפה נואר",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/slack.jpg").open
             },
             {
               title: "שוטף כלים",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות המטבח",
               location: "השפלה ודרום הארץ",
               job_author: "ארומה",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/trello.jpg").open
             },
             {
               title: "מארחת",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות המטבח",
               location: "תל אביב והמרכז",
               job_author: "אמורה מיו",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/wordpress.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות שירות ואירוח",
               location: "אזור השרון",
               job_author: "ג'פניקה",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/basecamp.jpg").open
             },
             {
               title: "טבח",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות כלליים",
               location: "אזור השרון",
               job_author: "דיקסי",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/twitter.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות כלליים",
               location: "תל אביב והמרכז",
               job_author: "בלאק",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/web-crunch.jpg").open
             },
             {
               title: "משווק",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות ניהול ומנהלה",
               location: "הצפון, חיפה והקריות",
               job_author: "קפה נואר",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/slack.jpg").open
             },
             {
               title: "שוטף כלים",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות ניהול ומנהלה",
               location: "השפלה ודרום הארץ",
               job_author: "ארומה",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/trello.jpg").open
             },
             {
               title: "מארחת",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות המטבח",
               location: "תל אביב והמרכז",
               job_author: "אמורה מיו",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/wordpress.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות המטבח",
               location: "ירושלים וסביבותיה",
               job_author: "ג'פניקה",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/basecamp.jpg").open
             },
             {
               title: "טבח",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "ייעוץ, מכירות ושיווק",
               location: "ירושלים וסביבותיה",
               job_author: "דיקסי",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/twitter.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               job_type: "מקצועות שירות ואירוח",
               location: "תל אביב והמרכז",
               job_author: "בלאק",
               state: 1,
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/web-crunch.jpg").open
             }
             ])
