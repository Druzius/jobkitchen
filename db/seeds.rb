# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Job.destroy_all
User.destroy_all


user = User.new(
  id: 2,
  name: "Daniel Kol",
  email: "daniel@example.com",
  password: "asdasd",
  password_confirmation: "asdasd"
)
user.save!

Job.create!([{
               title: "שף ראשי",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://facebook.com",
               apply_url: "https://facebook.com/apply",
               job_type: "Full-time",
               location: "תל אביב",
               job_author: "ארומה",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/facebook.jpg").open
             },
             {
               title: "משווק",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://slack.com",
               apply_url: "https://slack.com/apply",
               job_type: "Contract",
               location: "תל אביב",
               job_author: "קפה נואר",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/slack.jpg").open
             },
             {
               title: "שוטף כלים",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://trello.com",
               apply_url: "https://trello.com/apply",
               job_type: "Full-time",
               location: "תל-אביב",
               job_author: "ארומה",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/trello.jpg").open
             },
             {
               title: "מארחת",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://wordpress.org",
               apply_url: "https://wordpress.org/apply",
               job_type: "Full-time",
               location: "תל-אביב",
               job_author: "אמורה מיו",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/wordpress.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://basecamp.com",
               apply_url: "https://basecamp.com/apply",
               job_type: "Full-time",
               location: "ירושלים",
               job_author: "ג'פניקה",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/basecamp.jpg").open
             },
             {
               title: "טבח",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://twitter.com",
               apply_url: "https://twitter.com/apply",
               job_type: "Part-time",
               location: "ירושלים",
               job_author: "דיקסי",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/twitter.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://lewagon.com",
               apply_url: "https://lewagon.com/apply",
               job_type: "Full-time",
               location: "תל-אביב",
               job_author: "בלאק",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/web-crunch.jpg").open
             },
             {
               title: "Marketer",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://slack.com",
               apply_url: "https://slack.com/apply",
               job_type: "Contract",
               location: "תל-אביב",
               job_author: "קפה נואר",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/slack.jpg").open
             },
             {
               title: "שוטף כלים",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://trello.com",
               apply_url: "https://trello.com/apply",
               job_type: "Full-time",
               location: "תל-אביב",
               job_author: "ארומה",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/trello.jpg").open
             },
             {
               title: "מארחת",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://wordpress.org",
               apply_url: "https://wordpress.org/apply",
               job_type: "Full-time",
               location: "תל-אביב",
               job_author: "אמורה מיו",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/wordpress.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://basecamp.com",
               apply_url: "https://basecamp.com/apply",
               job_type: "Full-time",
               location: "ירושלים",
               job_author: "ג'פניקה",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/basecamp.jpg").open
             },
             {
               title: "טבח",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://twitter.com",
               apply_url: "https://twitter.com/apply",
               job_type: "Part-time",
               location: "ירושלים",
               job_author: "דיקסי",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/twitter.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://lewagon.com",
               apply_url: "https://lewagon.com/apply",
               job_type: "Full-time",
               location: "תל-אביב",
               job_author: "בלאק",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/web-crunch.jpg").open
             },
             {
               title: "Marketer",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://slack.com",
               apply_url: "https://slack.com/apply",
               job_type: "Contract",
               location: "תל-אביב",
               job_author: "קפה נואר",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/slack.jpg").open
             },
             {
               title: "שוטף כלים",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://trello.com",
               apply_url: "https://trello.com/apply",
               job_type: "Full-time",
               location: "תל-אביב",
               job_author: "ארומה",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/trello.jpg").open
             },
             {
               title: "מארחת",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://wordpress.org",
               apply_url: "https://wordpress.org/apply",
               job_type: "Full-time",
               location: "תל-אביב",
               job_author: "אמורה מיו",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/wordpress.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://basecamp.com",
               apply_url: "https://basecamp.com/apply",
               job_type: "Full-time",
               location: "ירושלים",
               job_author: "ג'פניקה",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/basecamp.jpg").open
             },
             {
               title: "טבח",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://twitter.com",
               apply_url: "https://twitter.com/apply",
               job_type: "Part-time",
               location: "ירושלים",
               job_author: "דיקסי",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/twitter.jpg").open
             },
             {
               title: "מלצר",
               description: "קווי האופי המובהקים של אוסף המסות הזה – סוגה שנכחדה כמעט לחלוטין בספרות העברית – הם סקרנות עצומה, כבוד למסורת התרבותית, חירות אינטלקטואלית, רוחב דעת וצלילות. צלקה נע באלגנטיות ובתנופה בין רשימות מסע להרהורים על אמנות, מוזיקה וציור, בין חיי היומיום בתל אביב ",
               url: "https://lewagon.com",
               apply_url: "https://lewagon.com/apply",
               job_type: "Full-time",
               location: "תל-אביב",
               job_author: "בלאק",
               user_id: user.id,
               avatar: Rails.root.join("app/assets/images/web-crunch.jpg").open
             }
             ])
