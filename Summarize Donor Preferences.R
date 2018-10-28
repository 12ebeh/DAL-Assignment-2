library(dplyr)

setwd("C:/DAL Assignment 2/")
df <- read.csv("Donations for Clustering.csv")

df.summarized <-
  group_by(df, Donor.ID,  Cluster, Donor.State, Donor.Is.Teacher, Incomplete.Location) %>%
  summarise(
    Count = n(),
    Optional.Donation.Proportion = sum(Optional.Donation) / Count,
    School.Urban.Interest = (sum(School.Metro.Urban) / Count) >= 0.5,
    School.Town.Interest = (sum(School.Metro.Town) / Count) >= 0.5,
    School.Suburban.Interest = (sum(School.Metro.Suburban) / Count) >= 0.5,
    School.Rural.Interest = (sum(School.Metro.Rural) / Count) >= 0.5,
    Provety.School.Interest = (sum(Marked.as.Provety) / Count) >= 0.5,
    School.In.Donor.State.Proportion = sum(School.In.Donor.State) / Count,
    Applied.Learning.Interest = (sum(Is.Applied.Learning) / Count) >= 0.5,
    Literacy...Language.Interest = (sum(Is.Literacy...Language) / Count) >= 0.5,
    Special.Needs.Interest = (sum(Is.Special.Needs) / Count) >= 0.5,
    History...Civics.Interest = (sum(Is.History...Civics) / Count) >= 0.5,
    Math...Science.Interest = (sum(Is.Math...Science) / Count) >= 0.5,
    Health...Sports.Interest = (sum(Is.Health...Sports) / Count) >= 0.5,
    Music...The.Arts.Interest = (sum(Is.Music...The.Arts) / Count) >= 0.5,
    Warmth.Interest = (sum(Is.Warmth) / Count) >= 0.5,
    Care...Hunger.Interest = (sum(Is.Care...Hunger) / Count) >= 0.5,
    Grades.PreK.2.Interest = (sum(Grades.PreK.2) / Count) >= 0.5,
    Grades.3.5.Interest = (sum(Grades.3.5) / Count) >= 0.5,
    Grades.6.8.Interest = (sum(Grades.6.8) / Count) >= 0.5,
    Grades.9.12.Interest = (sum(Grades.9.12) / Count) >= 0.5,
    Project.Cost.Min = min(Project.Cost),
    Project.Cost.Max = max(Project.Cost),
    Project.Cost.Average = mean(Project.Cost),
    Average.Days.Left.On.Project = mean(Days.Left.On.Project)
  )

write.csv(df.summarized, file="Donor Preferences.csv", row.names = F)
