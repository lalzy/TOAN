(in-package #:toan)

(defparameter *exe-exit* nil)
(defparameter *debug* t)

(defparameter *players* '())
(defparameter *player* 'ph)
(defparameter *destiny-dice-p* t) ; Program do destiny dice or not
(defparameter *book-of-tales-p* nil) ; if loading up book-of-tales-p, will be true


(defparameter *Paragraphs* '((1 (1 "Rock Slide" F) (2 "Rock Slide" F) (3 "Bloodthirsty Brigands" I) (4 "Lonely Prince" A)
			      (5 "Mystic Fire" F) (6 "Minor Treasure" E) (7 "Strange Artifact" E) (8 "Terrible Storm" F)
			      (9 "Terrible Storm" F) (10 "Ghostly Beast" J) (11 "Ghostly Beast" J) (12 "All-Powerful Efreet" M))
			     
			     (2 (1 "Disguised Beggar" C) (2 "Disguised Maiden" L)(3 "Greedy Captain" I)(4 "Terrible Storm" F)
			      (5 "Malicious Merman" I)(6 "Treacherous Shoals" F)(7 "Fearful Captain" I)(8 "Fearful Captain" I)
			      (9 "Crafty Wizard" O)(10 "Beautiful Enchantress" O)(11 "Huge Whirlpool" F)(12 "Huge Whirlpool" F))

			     (3(1 "Greedy Ne'er-do-well" D)(2 "Lovesick Maiden" L)(3 "Bloodthirsty Brigands" I)(4 "Destitute Prophet" A)
			      (5 "Sand Storm" F)(6 "Hungry Creatures" J)(7 "Egg of Roc" J)(8 "Jeweled Trapdoor" E)
			      (9 "Dark River" F)(10 "Cold Wizard" O)(11 "Ancient City" E)(12 "Ancient City" E))
			     
			     (4 (1 "Lost Merchant" L) (2 "Wicked Hag" C) (3 "Mad Slave" D) (4 "Friendly Merman" I)
			      (5 "Mild Storm" F) (6 "Malicious Merman" I) (7 "Malicious Merman" I) (8 "Fearful Captain" I)
			      (9 "Beautiful Shoals" F) (10 "Treacherous Shoals" F) (11 "Mad Captain" I) (12 "Terrible Storm" F))

			     (5 (1 "Talking Beast" J) (2 "Friendly Hunchback" C) (3 "Wealthy Ne'er-do-well" D) (4 "Enchanted Maiden" L)
			      (5 "Sad Gooleh" I) (6 "Hungry Gooleh" I) (7 "Dark River" F) (8 "Enchanted Beast" J)
			      (9 "Secret Trapdoor" E) (10 "Mystic Fire" F) (11 "Talking Beast" J) (12 "Ancient City" E) )

			     (6 (1 "Hideous Beggar" C) (2 "Cheating Merchant"  L) (3 "Skillful Thief" D ) (4 "Doomsaying Prophet" A)
			      (5 "Fine Beast" J ) (6 "Beautiful Princess" A) (7 "House Fire" F) (8 "Mighty Wizard" O)
			      (9 "Bloodthirsty Brigands" I) (10 "Mysterious Trapdoor" E ) (11 "Strange Artifact" E ) (12 "Ruined City" E ))

			     (7 (1 "Destitute Merchant" L) (2 "Armed Thief" D) (3 "Mild Storm" F) (4 "Rock Slide" F)
			      (5 "Sad Gooleh" I) (6 "Bloodthirsty Brigands" I) (7 "Secret Trapdoor" E) (8 "Horrible Creatures" j)
			      (9 "Mysterious Trapdoor" E ) (10 "Magical Storm" F) (11 "Ruined City" E) (12 "Demonic 'Efreet" M) )

			     (8 (1 "Mild Storm" F) (2 "Beautiful Shoals" F) (3 "Beautiful Shoals" F) (4 "Greedy Captain" I)
			      (5 "Greedy Captain" I) (6 "Minor Treasure" E) (7 "Huge Whirlpool" F) (8 "Black Whirlpool" F)
			      (9 "Malicious Merman" I) (10 "Mad Captain" I) (11 "Friendly Merman" I) (12 "Black 0Whirlpool" F))
			     
			     (9 (1 "Dying Hag" C) (2 "Wealthy Merchant" L) (3 "Multitudinous Brigands" I) (4 "Sand Storm" F)
			      (5 "Unknown Beast" j) (6 "Old Man" I) (7 "Multitudinous Brigands" I) (8 "Hungry Creatures" j)
			      (9 "Sand Storm" F) (10 "Horrible Creatures" j) (11 "Mighty Wizard" o) (12 "Wonderful Artifact" E))

			     (10 (1 "Old Man" I) (2 "Diseased Hunchback" C) (3 "Mad Prophet" A) (4 "Powerful Dervish" L)
			      (5 "Malicious Merman" I) (6 "Strange Customs" I) (7 "Beautiful Shoals" F) (8 "Talking Beast" J)
			      (9 "Mysterious River" F) (10 "Terrible Storm" F) (11 "Ruined City" E) (12 "Wonderful Artifact" E))

			     (11 (1 "Foolish Slave" D) (2 "Ugly Beggar" C) (3 "Whirling Dervish" L) (4 "Mild Storm" F)
			      (5 "Merry Brigands" I) (6 "Dark River" F) (7 "Enchanted Beast" J) (8 "Dark Creatures" J)
			      (9 "Ghostly Beast" J) (10 "Glittering Artifact" E) (11 "Hidden City" E) (12 "Wonderful Artifact" E))

			     (12(1 "Lovesick Thief" D) (2 "Blind Man" I) (3 "Garrulous Soldier" L) (4 "House Fire" F)
			      (5 "Possessed Hunchback" C) (6 "Minor Treasure" E) (7 "Con Game" I) (8 "Trapped 'Efreet" M)
			      (9 "Unknown Beast" J) (10 "Mystic Fire" F) (11 "Strange Artifact" E) (12 "Wonderful Artifact" E))

			     (13 (1 "Disguised Soldier" L) (2 "Runaway Slave" D) (3 "Mad Sage" A) (4 "Mild Storm" F)
			      (5 "Mild Storm" F) (6 "Mystic Fire" F) (7 "Magical Storm" F) (8 "Old Man" I)
			      (9 "Flying Creatures" J) (10 "Fabulous Treasure" E) (11 "Fabulous Treasure" E) (12 "Wonderful Artifact" E) )

			     (14 (1 "Repentant Thief" D) (2 "Imprisoned Maiden" L) (3 "Mad Prophet" A) (4 "Mild Storm" F)
			      (5 "Malicious Merman" I) (6 "Fearful Captain" I) (7 "Glittering Artifact" E) (8 "Enchanted Beast" J)
			      (9 "Treacherous Shoals" F) (10 "Mad Captain" I) (11 "Terrible Storm" F) (12 "Fabulous Treasure" E))

			     (15 (1 "Blind Man" I) (2 "Strange Customs" I) (3 "Sand Storm" F) (4 "Unknown Beast" J)
			      (5 "Hungry Gooleh" I) (6 "Minor Treasure" E) (7 "Talking Beast" J) (8 "Talking Beast" J)
			      (9 "Enchanted Beast" J) (10 "Bloodthirsty Enchantress" O) (11 "Mighty Wizard" O) (12 "Beautiful 'Efreeteh" M))

			     (16 (1 "Destitute Beggar" C) (2 "Destitute Ne'er-do-well" D)  (3 "Lonely Maiden" L)  (4 "Mild Storm" F)
			      (5 "Beautiful Shoals" F)  (6 "Treacherous Shoals" F)     (7 "Unknown Beast"  J)  (8 "Greedy Captain" I)
			      (9 "Mysterious River" F)  (10 "Malicious Merman" I)  (11 "Ancient City" E )      (12 "Wonderful Artifact" E ))
			     
			     (17 (1 "Garrulous Merchant" L)  (2 "Lost Sage" A)    (3 "Foolish Ne'er-do-well" D)   (4 "Hideous Hunchback" C)
			      (5 "Mild Storm" F)   (6 "Ghostly Beast" J)  (7 "Dark Creatures" J) (8 "Dark River" F)
			      (9 "Magical Storm" F) (10 "Small Artifact" E)    (11 "Jeweled Trapdoor" E) 	       (12 "Wonderful Artifact" E))

			     (18 (1 "Impudent Hag" C)    (2 "Cheating Merchant" L)  (3 "Old Man" I)    (4 "Armed Thief" D)
			      (5 "Strange Customs" I)    (6 "Con Game" I)  (7 "Mystic Fire" F)  (8 "Hungry Creatures" J)
			      (9 "Enchanted Beast" J )  (10 "Secret Trapdoor" E)  (11 "Ruined City" E)  (12 "Wonderful Artifact" E))
			     
			     (19 (1 "Foolish Ne'er-do-wel"l D) (2 "Mad Soldier" L) (3 "Dying Beggar" C) (4 "Doomsaying Prophet" A)
			      (5 "Rock Slide" F)   (6 "Sad Gooleh" I)   (7 "Multitudinous Brigands" I)  (8 "Dark River" F)
			      (9 "Horrible Creatures" J)  (10 "Talking Beast"  J)  (11 "Jeweled Trapdoor" E )    (12 "Hidden City" E))
			     
			     (20 (1 "Disguised Dervish" L)  (2 "Mild Storm" F)  (3 "Skillful Thief" D)  (4 "Insane Hunchback" C)
			      (5 "Friendly Merman" I)   (6 "Fearful Captain" I)  (7 "Black Whirlpool" F)   (8 "Glittering Artifact" E)
			      (9 "Huge Whirlpool" F)   (10 "Mad Captain" I)   (11 "Small Artifact" E)  (12 "Terrible Storm" F))

			     (21 (1 "Diseased Hag" C)   (2 "Whirling Dervish" L)    (3 "Bloodthirsty Brigands" I)   (4 "Destitute Prince" A)
			      (5 "Hungry Gooleh" I)   (6 "Sand Storm" F)   (7 "Flying Creatures" J)  (8 "Mighty Enchantress" O)
			      (9 "Learned 'Efreet" M)  (10 "Mysterious Trapdoor" E)    (11 "Jeweled Trapdoor" E)  (12 "Wonderful Artifact" E))

			     (22 (1 "Lovesick Ne'er-do-well" D)  (2 "Needy Thief" D)   (3 "Friendly Hag" C)  (4 "Strange Customs" I)
			      (5 "Beautiful Princess" A)  (6 "Wicked Vizier" I)   (7 "Guarded Treasure" E)   (8 "Guarded Treasure" E)
			      (9 "Crafty Wizard" O)  (10 "Beautiful Enchantress" O)  (11 "Angry 'Efreeteh" M)  (12 "Angry 'Efreeteh" M))

			     (23 (1 "Toothless Hunchback" C)   (2 "Terrible Storm" F)  (3 "Lonely Prophet" A)  (4 "Vengeful Soldier" L)
			      (5 "Small Artifact" E)  (6 "Merry Brigands" I)   (7 "Hungry Gooleh" I)  (8 "Mysterious River" F)
			      (9 "Practical-Joker Wizard" O)   (10 "Strange Artifact" E)   (11 "Ghostly Beast" J)    (12 "Fabulous Treasure" E))

			     (24 (1 "Hideous Beggar" C)   (2 "Beautiful Maiden" L)   (3 "Blind Man" I)   (4 "Wise Sage" A)
			      (5 "House Fire" F)   (6 "Con Game" I)  (7 "Strange Customs" I)   (8 "Magical Storm" F)
			      (9 "Crafty Enchantress" O)  (10 "Wicked Vizier" I)   (11 "Secret Trapdoor" E)  (12 "Wonderful Artifact" E))

			     (25 (1 "Needy Ne'er-do-well" D)  (2 "False Prophet "A)  (3 "Dying Hag" C)  (4 "imprisoned Maiden" L)
			      (5 "Hungry Gooleh" I)   (6 "Mystic Fire" F)    (7 "Secret Trapdoor" E)  (8 "Flying Creatures" J)
			      (9 "Mysterious River" F)  (10 "Talking Beast" J)   (11 "Terrible Storm" F)  (12 "Wonderful Artifact" E))

			     (26 (1 "Runaway Ne'er-do-well" D)t  (2 "Handsome Soldier" L)  (3 "Lost Sage" A)   (4 "Lovesick Hag" C)
			      (5 "Friendly Merman" I)   (6 "Beautiful Shoals" F)  (7 "Treacherous Shoals" F)  (8 "Malicious Merman" I)
			      (9 "Malicious Merman" I)  (10 "Dark Creatures" J)   (11 "Black Whirlpool" F)   (12 "Black Whirlpool" F))

			     (27 (1 "Garrulous Sage" A)    (2 "Drunken Beggar" C)  (3 "Mad Thief" D)   (4 "Friendly Maiden" L)
			      (5 "Sand Storm" F)    (6 "Merry Brigands" I)   (7 "Mysterious River" F)   (8 "Hungry Creatures" J)
			      (9 "Merry Brigands" I)    (10 "Egg of Roc" J)  (11 "Small Artifact" E)  (12 "Wonderful Artifact" E))

			     (28 (1 "Impudent Hunchback" C) (2 "Drunken Ne'er-do-well" D) (3 "Old Man" I) (4 "Wicked Dervish" L)
			      (5 "Mild Storm" F) (6 "Small Artifact" E) (7 "Greedy Captain" I) (8 "Ruined City" E)
			      (9 "Magical Storm" F) (10 "Mad Captain" I) (11 "Malicious Merman" I) (12 "Treacherous Shoals" F))

			     (29 (1 "Cheating Merchant" L) (2 "Cheating Merchant" L) (3 "Unknown Beast" J) (4 "Minor Treasure" E)
			      (5 "Minor Treasure" E) (6 "Small Artifact" E) (7 "Guarded Treasure" E) (8 "Mad Enchantress" O)
			      (9 "Mad Enchantress" O) (10 "Learned 'Efreeteh" M) (11 "Noble 'Efreet" M) (12 "Noble 'Efreet" M))

			     (30 (1 "Runaway Ne'er-do-well" D) (2 "Drunken Hunchback" C) (3 "Con Game" I) (4 "House Fire" F)
			      (5 "Lovesick Prince" A) (6 "Strange Customs" I) (7 "Bloodthirsty Brigands" I) (8 "Talking Beast" J)
			      (9 "All-powerful 'Efreeteh" M) (10 "Secret Trapdoor" E) (11 "Guarded Treasure" E) (12 "Wonderful Artifact" E))

			     (31 (1 "Drunken Hag" C) (2 "Lost Merchant" L) (3 "Repentant Thief" D) (4 "Blind Man" I)
			      (5 "Merry Brigands" I) (6 "Mysterious Trapdoor" E) (7 "Dark River" F) (8 "Egg of Roc" J)
			      (9 "Minor Treasure" E) (10 "Talking Beast" J) (11 "Terrible Storm" F) (12 "Guarded Treasure" E))

			     (32 (1 "Adulterous Slave" D) (2 "Lovesick Beggar" C) (3 "Mild Storm" F) (4 "Friendly Merman" I)
			      (5 "Mild Storm" F)  (6 "Doomsaying Prophet" A) (7 "Mad Captain" I) (8 "Mad Captain" I)
			      (9 "Black Whirlpool" F) (10 "Small Artifact" E) (11 "Terrible Storm" F) (12 "Huge Whirlpool" F))

			     (33 (1 "Happy Ne'er-do-well" D) (2 "Disguised Merchant" L) (3 "Dangerous Hunchback" C) (4 "Sand Storm" F)
			      (5 "Foolish Prince" A) (6 "Strange Customs" I) (7 "Hungry Creatures" J) (8 "Hungry Gooleh" I)
			      (9 "Egg of Roc" J) (10 "Sand Storm" F) (11 "Sand Storm" F) (12 "Strange Artifact" E))

			     
			     (34 (1 "Ugly Hag" C)  (2 "Friendly Soldier" L)  (3 "Destitute Thief" D) (4 "Beautiful Shoals" F)
			      (5 "Fearful Captain" I) (6 "Strange Customs" I) (7 "Strange Customs" I) (8 "Mad Wizard" O)
			      (9 "Treacherous Shoals" F) (10 "Mysterious River" F) (11 "Horrible Creatures" J) (12 "Fabulous Treasure" E))

			     (35 (1 "Repentant Ne'er-do-well" D) (2 "Lovesick Soldier" L) (3 "Crafty Hag" C) (4 "Merry Brigands" I)
			      (5 "Mild Storm" F) (6 "Unknown Beast" J) (7 "Unknown Beast" J) (8 "Mysterious River" F)
			      (9 "Ghostly Beast" J) (10 "Hungry Gooleh" I) (11 "House Fire" F) (12 "Mysterious Trapdoor" E) )

			     (36 (1 "Destitute Hag" C) (2 "Enchanted Soldier" L) (3 "Imprisoned Maiden" L) (4 "Repentant Merchant" D)
			      (5 "Imprisoned Prince" A) (6 "Minor Treasure" E) (7 "Glittering Artifact" E) (8 "Glittering Artifact" E)
			      (9 "Magical Storm" F) (10 "Lovesick 'Efreeteh" M) (11 "Trapped 'Efreet" M) (12 "Angry 'Efreet" O))

			     
			     (37 (1 "Repentant Merchant" D) (2 "Flying Creatures" J) (3 "Dark River" F) (4 "Ghostly Beast" J)
			      (5 "Hungry Creatures" J) (6 "Dark Creatures" j) (7 "Horrible Creatures" J) (8 "Flying Creatures" J)
			      (9 "Egg of Roc" J) (10 "Bumbling Wizard" B) (11 "Evil Enchantress" B) (12 "Noble 'Efreet" M))

			     (38 (1 "Heart-rending Hag" C) (2 "Disguised Dervish" L) (3 "Friendly Princess" A) (4 "Sad Gooleh" I)
			      (5 "Sand Storm" F) (6 "Small Artifact" E) (7 "Egg of Roc" J) (8 "Mysterious River" F)
			      (9 "Multitudinous Brigands" I) (10 "Mysterious Trapdoor" E) (11 "Glittering Artifact" E) (12 "Wonderful Artifact" E))

			     (39 (1 "Old Man" I) (2 "Impudent Beggar" C) (3 "Runaway Slave" D) (4 "Destitute Merchant" L)
			      (5 "imprisoned Prophet" A) (6 "Sad Gooleh" I) (7 "Malicious Merman" I) (8 "Mysterious River" F)
			      (9 "Horrible Creatures" J) (10 "Dark Creatures" J) (11 "Ancient City" E) (12 "Wonderful Artifact" E))

			     
			     (40 (1 "Repentant Merchant" D) (2 "Runaway Slave" D) (3 "Wicked Beggar" C) (4 "Greedy Thief" D)
			      (5 "Garrulous Dervish" L) (6 "Fine Beast" J) (7 "Dark River" F) (8 "Horrible Creatures" J)
			      (9 "Demonic 'Efreeteh" M) (10 "Secret Trapdoor" E) (11 "Hidden City" E) (12 "Wonderful Artifact" E))

			     (41 (1 "House Fire" F) (2 "Hypnotic Hag" C) (3 "Fine Beast" J) (4 "Strange Customs" I)
			      (5 "Unknown Beast" J) (6 "Imprisoned Princess" A) (7 "Bloodthirsty Brigands" I) (8 "Mighty Wizard" O)
			      (9 "Secret Trapdoor" E) (10 "Glittering Artifact" E) (11 "Guarded Treasure" E) (12 "Wonderful Artifact" E))

			     (42 (1 "Adulterous Ne'er-do-well" D) (2 "Friendly Beggar" C) (3 "Healer Sage" A) (4 "Merry Brigands" I)
			      (5 "Mystic Fire" F) (6 "Crafty Enchantress" O) (7 "Mysterious River" F) (8 "Glittering Artifact" E)
			      (9 "Jeweled Trapdoor" E) (10 "jeweled Trapdoor" E) (11 "Bloodthirsty Brigands" I) (12 "Wonderful Artifact" E))

			     
			     (43 (1 "Friendly Merman" I) (2 "Friendly Merman" I) (3 "Fearful Captain" I) (4 "Treacherous Shoals" F)
			      (5 "Malicious Merman" I) (6 "Mad Captain" I) (7 "Black Whirlpool" F) (8 "Greedy Captain" I)
			      (9 "Greedy Captain" I) (10 "Friendly Merman" I) (11 "Huge Whirlpool" F) (12 "Black Whirlpool" F))

			     (44 (1 "Destitute Thief" D) (2 "Wicked Prophet" A) (3 "Sand Storm" F) (4 "Sand Storm" F)
			      (5 "Multitudinous Brigands" I) (6 "Multitudinous Brigands" I) (7 "Egg of Roc" J) (8 "Horrible Creatures" J)
			      (9 "Mysterious Trapdoor" E) (10 "Ruined City" E) (11 "Fabulous Treasure" E) (12 "Wonderful Artifact" E))

			     (45 (1 "Repentant Ne'er-do-well" D) (2 "Wicked Hunchback" C) (3 "False Sage" A) (4 "Wicked Dervish" L)
			      (5 "Friendly Merman" I) (6 "Mild Storm" F) (7 "Strange Customs" I) (8 "Strange Customs" I)
			      (9 "Fearful Captain" I) (10 "Mysterious River" F) (11 "Black Whirlpool" F) (12 "Wonderful Artifact" E))

			     
			     (46 (1 "Lovesick Beggar" C) (2 "Foolish Slave" D) (3 "Lost Dervish" L)  (4 "False Prophet" A)
			      (5 "Mild Storm" F)  (6 "Con Game" I)  (7 "Wicked Vizier" I)  (8 "House Fire" F)  (9 "Bloodthirsty Brigands" I)
			      (10 "Horrible Creatures" J)  (11 "Jeweled Trapdoor" E)  (12 "Wonderful Artifact" E))


			     (47 (1 "Lovesick Hunchback" C) (2 "Lonely Soldier" L) (3 "Foolish Thief" D) (4 "Small Artifact" E) 
			      (5 "Rock Slide" F) (6 "Sad Gooleh" I) (7 "Strange Customs" I) (8 "Enchanted Beast" J) 
			      (9 "Flying Creatures" J) (10 "Black River" F) (11 "Guarded Treasure" E) (12 "Wonderful Artifact" E))
			     
			     (48 (1 "Happy Ne'er-do-well" D) (2 "Dangerous Beggar" C) (3 "Foolish Princess" A) 
			      (4 "Friendly Merman" I) (5 "Beautiful Shoals" F) (6 "Malicious Merman" I) (7 "Fearful Captain" I) (8 "Treacherous Shoals" F) 
			      (9 "Hungry Creatures" J) (10 "Small Artifact" E) (11 "Huge Whirlpool" F)(12 "Huge Whirlpool" F))
			     

			     
			     (49 (1 "Fine Beast" J)  (2 "Enchanted Beast" J) (3 "Sad Gooleh" I)  (4 "Talking Beast" J)
			      (5 "Hungry Creatures" J)  (6 "Egg of Roc" J)  (7 "Ancient City" E)  (8 "Hidden City" E)
			      (9 "Bloodthirsty Wizard" O)  (10 "Noble Enchantress" B)  (11 "Lovesick 'Efreeteh" M)  (12 "Kindly 'Efreet" M))

			     (50 (1 "Drunken Slave" D) (2 "Insane Beggar" C) (3 "Garrulous Maiden" L) (4 "Vengeful Sage" A)
			      (5 "Runaway Stave" D) (6 "Merry Brigands" I) (7 "Hungry Gooleh" I) (8 "Unknown Beast" J)
			      (9 "Dark River" F) (10 "Demonic 'Efreet" M) (11 "Fabulous Treasure" E) (12 "Guarded Treasure" E))
			     
			     (51 (1 "Destitute Sage" A) (2 "Wise Thief" D) (3 "Insane Hunchback" C) (4 "Enchanted Soldier" L)
			      (5 "Mild Storm" F) (6 "Strange Customs" I) (7 "Wicked Vizier" I) (8 "Trapped 'Efreet" M)
			      (9 "Mysterious Trapdoor" E) (10 "Glittering Artifact" E) (11 "Fabulous Treasure" E) (12 "Fabulous Treasure" E))
			     
			     (52 (1 "Lovesick Slave" D)  (2 "Foolish Maiden" L)  (3 "Insane Hag" C)  (4 "Vengeful Princess" A)
			      (5 "Rock Slide" F) (6 "Ghostly Beast" J)  (7 "Dark River" F)  (8 "Bloodthirsty Brigands" I)
			      (9 "Secret Trapdoor" E)  (10 "Ruined City" E)  (11 "Magical Storm" F)  (12 "Wonderful Artifact" E))

			     
			     (53 (1 "Wise Slave" D)  (2 "Dying Hunchback" C)  (3 "Healer Sage" A)  (4 "Mild Storm" F)
			      (5 "Puissant Soldier" L)  (6 "Friendly Merman" I)  (7 "Greedy Captain" I)  (8 "Malicious Merman" I)
			      (9 "Bloodthirsty Brigands" I)  (10 "Terrible Storm" F)  (11 "Huge Whirlpool" F)  (12 "Hidden City" E))
			     
			     (54 (1 "Lovesick Hag" C)  (2 "Disguised Slave" D)  (3 "Sad Gooleh" I)  (4 "Dark Creatures" J)
			      (5 "Minor Treasure" E)  (6 "Horrible Creatures" J)  (7 "Small Artifact" E)  (8 "Ghostly Beast" J)
			      (9 "Flying Creatures" J)  (10 "Crafty Wizard" O)  (11 "Bloodthirsty Enchantress" O)  (12 "Trapped 'Efreet" M))
			     
			     (55 (1 "Wise Slave" D) (2 "Lost Soldier" L) (3 "Disguised Hunchback" C) (4 "Mild Storm" F)
			      (5 "Wealthy Merchant" D) (6 "Merry Brigands" I) (7 "Dark River" F) (8 "Sad Gooleh" I)
			      (9 "Strange Artifact" E) (10 "Mysterious Trapdoor" E) (11 "Ancient City" E) (12 "Wonderful Artifact" E))
			     
			     (56 (1 "Toothless Hag" C)  (2 "Greedy Thief" D)  (3 "Old Man" I)  (4 "House Fire" F)
			      (5 "House Fire" F)  (6 "Garrulous Prince" A)  (7 "Strange Customs" I)  (8 "Practical-Joker Enchantress" O)
			      (9 "Talking Beast" J)  (10 "Wicked Vizier" I)  (11 "Dark Creatures" J)  (12 "Fabulous Treasure" E))
			     
			     (57 (1 "Needy Ne'er-do-well" D) (2 "Dangerous Beggar" C) (3 "Mad Maiden" L) (4 "Wise Prince" A)
			      (5 "Mild Storm" F) (6 "Wise Merchant" D) (7 "Mystic Fire" F) (8 "Mystic Fire" F)
			      (9 "Multitudinous Brigands" I) (10 "Horrible Creatures" J) (11 "Glittering Artifact" E) (12 "Glittering Artifact" E))
			     
			     (58 (1 "Busy Slave" D) (2 "Destitute Merchant" L) (3 "Insane Beggar" C) (4 "Healer Sage" A)
			      (5 "Lonely Maiden" L) (6 "Merry Brigands" I) (7 "Unknown Beast" J)  (8 "Flying Creatures" J)
			      (9 "Mysterious River" F) (10 "Demonic 'Efreet" M) (11 "Glittering Artifact" E) (12 "Wonderful Artifact" E))
			      
			     (59 (1 "Mild Storm" F)(2 "Flying Creatures" J)(3 "Fine Beast" J)( 4 "Blind Man" I)
			      ( 5 "Hungry Creatures" J)( 6 "Ghostly Beast" J)( 7 "Dark Creatures" J)( 8 "Noble Wizard" B)
			      ( 9 "Mad Enchantress" O)( 10 "Lovesick 'Efreet" M)( 11 "Evil 'Efreeteh" M)( 12 "Learned 'Efreet" M))
			     
			     (60 (1 "Foolish Slave" D)( 2 "Heart-rending Beggar" C)( 3 "Lovesick Maiden" L)( 4 "Fine Beast" J)
			      ( 5 "Con Game" I)( 6 "Foolish Prince" A)( 7 "Doomsaying Prophet" A)( 8 "Wicked Vizier" I)
			      ( 9 "Talking Beast" J)( 10 "Strange Customs" I)( 11 "Secret Trapdoor" E)( 12 "Wonderful Artifact" E))
			     
			     (61 (1 "Ugly Hag" C)(2 "Skillful Thief" D)(3 "Wealthy Merchant" L)(4 "Enchanted Merchant" A)
			      (5 "Malicious Merman" I)(6 "Malicious Merman" I)(7 "Fearful Captain" I)(8 "Treacherous Shoals" F)
			      (9 "Beautiful Enchantress" O)(10 "Huge Whirlpool" F)(11 "Hidden City" E)(12 "Strange Artifact" E))
			     
			     (62 (1 "Busy Slave" D)(2 "Wicked Sage" A)(3 "Insane Beggar" C)(4 "Enchanted Sage" A)
			      (5 "Sand Storm" F)(6 "Egg of Roc" J)(7 "Flying Creatures" J)(8 "Flying Creatures" J)
			      (9 "Multitudinous Brigands" I)(10 "Glittering Artifact" E)(11 "Ancient City" E)(12 "Wonderful Artifact" E))
			     
			     (63 (1 "Foolish Soldier" L)(2 "Runaway Ne'er-do-well" D)(3 "Old Man" I)(4 "Enchanted Hunchback" C)
			      (5 "Friendly Merchant" A)(6 "Sad Gooleh" I)(7 "Talking Beast" J)(8 "Hidden City" E)
			      (9 "Mystic Fire" F)(10 "Black Whirlpool" F)(11 "Black Whirlpool" F)(12 "Mysterious Trapdoor" E))
			     
			     (64 (1 "Heart-rending Hag" C)(2 "Handsome Merchant" A)(3 "Armed Ne'er-do-well" D)(4 "Mild Storm" F)
			      (5 "Dark River" F)(6 "Minor Treasure" E)(7 "Hungry Gooleh" I)(8 "Enchanted Beast" J)
			      (9 "Vengeful 'Efreet" M)(10 "Horrible Creatures" J)(11 "Bloodthirsty Wizard" O)(12 "Strange Artifact" E))
			     
			     (65 (1 "Crafty Ne'er-do-well" D)(2 "Minor Treasure" E)(3 "Beautiful Princess" A)(4 "Small Artifact" E)
			      (5 "Glittering Artifact" E)(6 "Guarded Treasure" E)(7 "Strange Artifact" E)(8 "Strange Artifact" E)
			      (9 "Hidden Trapdoor" E)(10 "Ancient City" E)(11 "Angry 'Efreet" M)(12 "Learned Wizard" B))
			     
			     (66 (1 "Adulterous Thief" D)(2 "Mad Soldier" L)(3 "Old Man" I)(4 "Fearful Captain" I)
			      (5 "Beautiful Princess" A)(6 "Greedy Captain" I)(7 "Beautiful Shoals" F)(8 "Minor Treasure" E)
			      (9 "Friendly Merman" I)(10 "Malicious Merman" I)(11 "Small Artifact" E)(12 "Wonderful Artifact" E))
			     
			     (67 (1 "Drunken Thief" D)(2 "Mild Storm" F)(3 "Merry Brigands" I)(4 "Hypnotic Beggar" C)
			      (5 "Adulterous Thief "D)(6 "Puissant Soldier" L)(7 "Hungry Gooleh" I)(8 "Cold Enchantress" O)
			      (9 "Dark River" F)(10 "Jeweled Trapdoor" E)(11 "Hidden City" E)(12 "Wonderful Artifact" E))
			     
			     (68 (1 "Happy Slave" D)(2 "Crafty Beggar" C)(3 "Mad Sage" A)(4 "Mad Prophet" A)
			      (5 "Con Game" I)(6 "Strange Customs" I)(7 "Vengeful Prince" A)(8 "Destitute Maiden" L)
			      (9 "Whirling Dervish" L)(10 "All-powerful 'Efreeteh" M)(11 "Lovesick 'Efreet" M)(12 "Beautiful Enchantress" O))
			     
			     (69 (1 "Foolish Thief" D)(2 "Wicked Beggar" C)(3 "Lonely Maiden" L)(4 "Mild Storm" F)
			      (5 "Wealthy Princess" [A)(6 "Mystic Fire" F)(7 "Bloodthirsty Brigands" I)(8 "Beautiful Maiden" L)
			      (9 "Mysterious River" F)(10 "Ancient City" E)(11 "Terrible Storm" F)(12 "Wonderful Artifact" E))
			     
			     (70 (1 "Flying Creatures" J)(2 "Bloodthirsty Brigands" I)(3 "Unknown Beast" J)(4 "Unknown Beast" J)
			      (5 "Dark Creatures" J)(6 "Small Artifact" E)(7 "Guarded Treasure" E)(8 "Glittering Artifact" E)
			      (9 "Hidden City" E)(10 "Ruined City" E)(11 "Noble 'Efreet" M)(12 "Powerful Wizard" B))
			     
			     (71 (1 "Destitute Hunchback" C)(2 "Friendly Prophet" [A)(3 "Mad Ne'er-do-well" D)(4 "Whirling Dervish" L)
			      (5 "House Fire" F)(6 "Con Game" I)(7 "Strange Customs" I)(8 "Wicked Vizier" I)
			      (9 "Cold Enchantress" O)(10 "Fine Beast" J)(11 "Fine Beast" J)(12 "Wonderful Artifact" E))
			     
			     (72 (1 "Impudent Hunchback" C)(2 "Wicked Ne'er-do-well" D)(3 "Handsome Soldier" L)(4 "Lonely Prophet" A)
			      (5 "Mild Storm" F)(6 "Mystic Fire" F)(7 "Bloodthirsty Brigands" I)(8 "Ghostly Beast" J)
			      (9 "Horrible Creatures" J)(10 "Small Artifact" E)(11 "Mighty Enchantress" O)(12 "Magical Storm" F))
			     
			     (73 (1 "Cheating Merchant" L)(2 "Lonely Prophet" A)(3 "Diseased Hunchback" C)(4 "Friendly Merman" I)
			      (5 "Beautiful Shoals" F)(6 "Treacherous Shoals" F)(7 "Malicious Merman" I)(8 "Fearful Captain" I)
			      (9 "Greedy Captain" I)(10 "Terrible Storm" F)(11 "Black Whirlpool" F)(12 "Huge Whirlpool" F))
			     
			     (74 (1 "Needy Ne'er-do-well" D)(2 "Powerful Slave" D)(3 "Lovesick Maiden" L)(4 "Mad Prophet" A)
			      (5 "Rock Slide" F)(6 "Strange Customs" I)(7 "Strange Customs" I)(8 "Terrible Storm" F)
			      (9 "Magical Storm" F)(10 "Magical Stor"m F)(11 "Bumbling Enchantress" B)(12 "Enchanted Beast" J))
			     
			     (75 (1 "Mild Storm" F)(2 "Blind Man" I)(3 "Rock Slide" F)(4 "Mysterious River" F)
			      (5 "Unknown Beast" J)(6 "Strange Artifact" E)(7 "Crafty Wizard" o)(8 "Cold Enchantress" o)
			      (9 "Mysterious Trapdoor" E)(10 "Enchanted Beast" J)(11 "Ruined City" E)(12 "Wonderful Artifact" E))
			     
			     (76 (1 "Drunken Ne'er-do-well" D)(2 "Lost Prophet" A)(3 "Dangerous Hag" C)(4 "Powerful Dervish" L)
			      (5 "Mad Captain" [I)(6 "Bloodthirsty Enchantress" O)(7 "Unknown Beast" J)(8 "Demonic 'Efreeteh" M)
			      (9 "Beautiful Shoals" F)(10 "Black Whirlpool" F)(11 "Huge Whirlpool" F)(12 "Wonderful Artifact" E))
			     
			     (77 (1 "Lovesick Soldier" L)(2 "Lost Maiden" L)(3 "Disguised Slave" D)(4 "Egg of Roc" J)
			      (5 "Lost Prince" A)(6 "Lonely Princess" A)(7 "Ghostly Beast" J)(8 "Evil Enchantress" B)
			      (9 "Flying Creatures" J)(10 "Cold Wizard" O)(11 "Fabulous Treasure" E)(12 "Wonderful Treasure" E))
			     
			     (78 (1 "Armed Slave" D)(2 "Mild Storm" F)(3 "Puissant Soldier" L)(4 "Merry Brigands" I)
			      (5 "Multitudinous Brigands" I)(6 "Beautiful Enchantress" O)(7 "Guarded Treasure" E)(8 "Terrible Storm" F)
			      (9 "Magical Storm" F)(10 "Friendly Merman" I)(11 "Talking Beast" J)(12 "Black Whirlpool" F))
			     
			     (79 (1 "Lonely Soldier" L)(2 "Friendly Beggar" C)(3 "Foolish Thief" D)(4 "Garrulous Sage" A)
			      (5 "Kindly Merchant" B)(6 "Egg of Roc" J)(7 "Sand Storm" F)(8 "Hungry Creatures" J)
			      (9 "Mysterious River" F)(10 "Unknown Beast" J)(11 "Secret Trapdoor" E)(12 "Wonderful Artifact" E))
			     
			     (80 (1 "Mild Storm" F)(2 "Wicked Vizier" I)(3 "Mad Captain" I)(4 "Friendly Merman" I)
			      (5 "Strange Customs" I)(6 "Dark River" F)(7 "Mad Enchantress" O)(8 "Beautiful Shoals" F)
			      (9 "Mysterious Trapdoor" E)(10 "Strange Artifact" E)(11 "Ruined City" E)(12 "Wonderful Artifact" E))
			     
			     (81 (1 "Old Man" I)(2 "Wealthy Merchant" D)(3 "Mild Storm" F)(4 "Rock Slide" F)
			      (5 "Hungry Creatures" J)(6 "Sad Gooleh" I)(7 "Ghostly Beast" J)(8 "Wise Sage" A)
			      (9 "Trapped 'Efreet" M)(10 "Mad Wizard" O)(11 "Practical Joker Enchantress" O)(12 "All-powerful 'Efreeteh" M))
			     
			     (82 (1 "Destitute Thief" D)(2 "Dying Beggar" C)(3 "Mild Storm" F)(4 "Handsome Prince" A)
			      (5 "Malicious Merman" I)(6 "Greedy Captain" I)(7 "Beautiful Shoals" F)(8 "Mad Captain" I)
			      (9 "Huge Whirlpool" F)(10 "Terrible Storm" F)(11 "Ruined City" E)(12 "Ruined City" E))
			     
			     (83 (1 "Toothless Hag" C)(2 "Disguised Slave" D)(3 "Blind Man" I)(4 "Egg of Roc" J)
			      (5 "Foolish Prince" A)(6 "Sad Gooleh" I)(7 "Multitudinous Brigands" I)(8 "Mystic Fire" F)
			      (9 "Enchanted Beast" J)(10 "All-powerful 'Efreet" M)(11 "Strange Artifact" E)(12 "Hidden City" E))
			     
			     (84 (1 "Kindly" B) (2 "Bumbling" B) (3 "Needy" B) (4 "Needy" B)
			      (5 "Disguised" B) (6 "Trapped" B) (7 "Mad" B) (8 "Mad" B)
			      (9 "Evil" B) (10 "Vengeful" B) (11 "Doomed" B) (12 "Mighty" B))
			     
			     (85 (1 "Lonely" A)(2 "Garrulous" A)(3 "Destitute" A)(4 "Foolish" A)
			      (5 "Friendly" A)(6 "Imprisoned" A)(7 "Disguised" A)(8 "Mad" A)
			      (9 "Vengeful" A)(10 "Wicked" A)(11 "Enchanted" A)(12 "Enchanted" A))
			     
			     (86 (1 "Friendly"  C)(2 "Friendly"  C)(3 "Destitute"  C)(4 "Impudent"  C)
			      (5 "Ugly"  C)(6 "Disguised"  C)(7 "Crafty"  C)(8 "Dying"  C)
			      (9 "Possessed"  C)(10 "Wicked"  C)(11 "Dangerous"  C)(12 "Powerful"  C))
			     
			     (87 (1 "Friendly" A)(2 "Foolish" A)(3 "Destitute" A)(4 "Handsome" A)
			      (5 "Disguised" A)(6 "Wealthy" A)(7 "Imprisoned" A)(8 "Mad" A)
			      (9 "Vengeful" A)(10 "Vengeful" A)(11 "Wicked" A)(12 "Powerful" A))
			     
			     (88 (1 "Kindly" B)(2 "Needy" B)(3 "Bumbling" B)(4 "Bumbling" B)
			      (5 "Lovesick" B)(6 "Disguised" B)(7 "Crafty" B)(8 "Vengeful" B)
			      (9 "Evil" B)(10 "Powerful" B)(11 "Mighty" B)(12 "Mighty" B))
			     
			     (90 (1 "Friendly" A)(2 "Foolish" A)(3 "Garrulous" A)(4 "Destitute" A)
			      (5 "False" A)(6 "Disguised" A)(7 "Wise" A)(8 "Imprisoned" A)
			      (9 "Enchanted" A)(10 "Wicked" A)(11 "Mad" A)(12 "Powerful" A))
			     
			     (91 (1 "Toothless" C)(2 "Destitute" C)(3 "Dying" C)(4 "Diseased" C)
			      (5 "Diseased" C)(6 "Enchanted" C)(7 "Crafty" C)(8 "Possessed" C)
			      (9 "Hypnotic" C)(10 "Hideous" C)(11 "Insane" C)(12 "Dangerous" C))
			     
			     (92 (1 "Happy" D)(2 "Foolish" D)(3 "Greedy" D)(4 "Drunken" D)
			      (5 "Drunken" D)(6 "Disguised" D)(7 "Crafty" D)(8 "Crafty" D)
			      (9 "Disguised" D)(10 "Armed" D)(11 "Mad" D)(12 "Wicked" D))
			     
			     (93 (1 "Friendly" A)(2 "Foolish" A)(3 "Destitute" A)(4 "Lonely" A)
			      (5 "Disguised" A)(6 "Wealthy" A)(7 "Vengeful" A)(8 "Wicked" A)
			      (9 "Mad" A)(10 "Mad" A)(11 "Enchanted" A)(12 "Powerful" A))
			     
			     (94 (1 "Kindly" M)(2 "Kindly" M)(3 "Trapped" M)(4 "Lovesick" M)
			      (5 "Lovesick" M)(6 "Vengeful" M)(7 "Evil" M)(8 "Evil" M)
			      (9 "Noble" M)(10 "Learned" M)(11 "Demonic" M)(12 "All-Powerful" M))
			     
			     (95 (1 "Kindly" B)(2 "Lovesick" B)(3 "Bumbling" B)(4 "Noble" B)
			      (5 "Evil" B)(6 "Crafty" B)(7 "Disguised" B)(8 "Vengeful" B)
			      (9 "Mad" B)(10 "Doomed" B)(11 "Mighty" B)(12 "All-Powerful" B))
			     
			     (97 (1 "Happy" D)(2 "Needy" D)(3 "Greedy" D)(4 "Foolish" D)
			      (5 "Foolish" D)(6 "Lovesick" D)(7 "Disguised" D)(8 "Disguised" D)
			      (9 "Crafty" D)(10 "Armed" D)(11 "Mad" D)(12 "Wicked" D))
			     
			     (98 (1 "Friendly" A)(2 "Foolish" A)(3 "Destitute" A)(4 "False" A)
			      (5 "Garrulous" A)(6 "Wise" A)(7 "Imprisoned" A)(8 "Vengeful" A)
			      (9 "Mad" A)(10 "Mad" A)(11 "Doomsaying" A)(12 "Powerful" A))
			     
			     (99 (1 "Friendly" A)(2 "Foolish" A)(3 "Destitute" A)(4 "Wise" A)
			      (5 "Imprisoned" A)(6 "Healer" A)(7 "Healer" A)(8 "Healer" A)
			      (9 "Vengeful" A)(10 "Mad" A)(11 "Wicked" A)(12 "Powerful" A))
			     
			     (100 (1 "Impudent" C)(2 "Dying" C)(3 "Diseased" C)(4 "Crafty" C)
			      (5 "Disguised" C)(6 "Wicked" C)(7 "Hypnotic" C)(8 "Hideous" C)
			      (9 "Hideous" C)(10 "Enchanted" C)(11 "Dangerous" C)(12 "Powerful" C))
			     
			     (101 (1 "Friendly" C)(2 "Impudent" C)(3 "Ugly" C)(4 "Destitute" C)
			      (5 "Disguised" C)(6 "Drunken" C)(7 "Lovesick" C)(8 "Dying" C)
			      (9 "Diseased" C)(10 "Heart-rending" C)(11 "Possessed" C)(12 "Insane" C))
			     
			     (102 (1 "Friendly" A)(2 "Handsome" A)(3 "Lonely" A)(4 "Lovesick" A)
			      (5 "Disguised" A)(6 "Imprisoned" A)(7 "Wealthy" A)(8 "Enchanted" A)
			      (9 "Mad" A)(10 "Wicked" A)(11 "Wicked" A)(12 "Powerful" A))
			     
			     (105 (1 "Destitute" C)(2 "Drunken" C)(3 "Diseased" C)(4 "Impudent" C)
			      (5 "Dying" C)(6 "Heart-rending" C)(7 "Crafty" C)(8 "Insane" C)
			      (9 "Wicked" C)(10 "Enchanted" C)(11 "Hypnotic" C)(12 "Powerful" C))
			     
			     (106 (1 "Happy" D)(2 "Wise" D)(3 "Skillful" D)(4 "Drunken" D)
			      (5 "Wealthy" D)(6 "Repentant" D)(7 "Armed" D)(8 "Crafty" D)
			      (9 "Greedy" D)(10 "Wicked" D)(11 "Powerful" D)(12 "Powerful" D))
			     
			     (107 (1 "Wise" D)(2 "Needy" D)(3 "Busy" D)(4 "Drunken" D)
			      (5 "Runaway" D)(6 "Armed" D)(7 "Crafty" D)(8 "Adulterous" D)
			      (9 "Mad" D)(10 "Wicked" D)(11 "Wicked" D)(12 "Powerful" D))
			     
			     (108 (1 "Happy" D)(2 "Destitute" D)(3 "Lovesick" D)(4 "Foolish" D)
			      (5 "Wealthy" D)(6 "Armed" D)(7 "Disguised" D)(8 "Greedy" D)
			      (9 "Adulterous" D)(10 "Crafty" D)(11 "Wicked" D)(12 "Wicked" D))
			     
			     (109 (1 "Friendly" A)(2 "Lost" A)(3 "Beautiful" A)(4 "Imprisoned" A)
			      (5 "Destitute" A)(6 "Disguised" A)(7 "Wealthy" A)(8 "Enchanted" A)
			      (9 "Vengeful" A)(10 "Wicked" A)(11 "Mad" A)(12 "Powerful" A))
			     
			     (110 (1 "Friendly" A)(2 "Lonely" A)(3 "Lovesick" A)(4 "Beautiful" A)
			      (5 "Beautiful" A)(6 "Lost" A)(7 "Imprisoned" A)(8 "Disguised" A)
			      (9 "Vengeful" A)(10 "Wicked" A)(11 "Powerful" A)(12 "Powerful" A))
			     
			     (113 (1 "Friendly" A)(2 "Lovesick" A)(3 "Beautiful" A)(4 "Beautiful" A)
			      (5 "Wealthy" A)(6 "Wealthy" A)(7 "Lost" A)(8 "Imprisoned" A)
			      (9 "Mad" A)(10 "Wicked" A)(11 "Enchanted" A)(12 "Powerful" A))
			     
			     (114 (1 "Kindly" B)(2 "Needy" B)(3 "Bumbling" B)(4 "Self-Sacrificial" B)
			      (5 "Beautiful" B)(6 "Noble" B)(7 "Learned" B)(8 "Disguised" B)
			      (9 "Crafty" B)(10 "Mad" B)(11 "Evil" B)(12 "Powerful" B))
			     
			     (115 (1 "Kindly" B)(2 "Bumbling" B)(3 "Beautiful" B)(4 "Noble" B)
			      (5 "Disguised" B)(6 "Crafty" B)(7 "Doomed" B)(8 "Vengeful" B)
			      (9 "Mad" B)(10 "Evil" B)(11 "Powerful" B)(12 "Mighty" B))
			     
			     (116 (1 "Kindly" M)(2 "Lovesick" M)(3 "Beautiful" M)(4 "Trapped" M)
			      (5 "Vengeful" M)(6 "Evil" M)(7 "Evil" M)(8 "Noble" M)
			      (9 "Noble" M)(10 "Learned" M)(11 "Demonic" M)(12 "All-Powerful" M))
			     
			     (117 (1 "Kindly" B)(2 "Bumbling" B)(3 "Lovesick" B)(4 "Beautiful" B)
			      (5 "Beautiful" B)(6 "Vengeful" B)(7 "Vengeful" B)(8 "Mad" B)
			      (9 "Evil" B)(10 "Mighty" B)(11 "Mighty" B)(12 "All-Powerful" B))
			     
			     (118 (1 "Kindly" M)(2 "Learned" M)(3 "Learned" M)(4 "Lovesick" M)
			      (5 "Trapped" M)(6 "Trapped" M)(7 "Angry" M)(8 "Demonic" M)
			      (9 "Evil" M)(10 "Vengeful" M)(11 "All-powerful" M)(12 "All-powerful" M))
			     
			     (119 (1 "Lovesick" M)(2 "Lovesick" M)(3 "Trapped" M)(4 "Trapped" M)
			      (5 "Angry" M)(6 "Kindly" M)(7 "Demonic" M)(8 "Vengeful" M)
			      (9 "Evil" M)(10 "Noble" M)(11 "Noble" M)(12 "All-powerful" M))
			     
			     (120 (1 "Angry" M)(2 "Lovesick" M)(3 "Trapped" M)(4 "Beautiful" M)
			      (5 "Beautiful" M)(6 "Noble" M)(7 "Learned" M)(8 "Learned" M)
			      (9 "Vengeful" M)(10 "Kindly" M)(11 "Evil" M)(12 "All-powerful" M))
			     
			     (121 (1 "Kindly" M)(2 "Kindly" M)(3 "Beautiful" M)(4 "Noble" M)
			      (5 "Noble" M)(6 "All-powerful" M)(7 "All-powerful" M)(8 "Vengeful" M)
			      (9 "Lovesick" M)(10 "Evil" M)(11 "Demonic" M)(12 "Trapped" M))))


;;; First element is letter category, second element is list of actions, third element is encounter type
(defparameter *R-M* '((a (grovel aid rob avoid converse attack court abduct honor)
		       (beautiful destitute disguised doomsaying enchanted false foolish friendly garrulous
			handsome healer imprisoned lonely lost lovesick mad powerful vengeful wealthy wicked wise))
		      (b (grovel aid rob avoid bargain attack court trick hire)
		       (all-powerful beautiful bumbling crafty disguised doomed evil kindly learned lovesick mad mighty needy
			noble powerful self-sacrificial trapped vengeful))
		      (c (beat enrich rob avoid question attack follow hire)
		       (crafty dangerous destitute diseased disguised drunken dying enchanted friendly heart-rending hideous
			hypnotic impudent insane lovesick possessed powerful toothless ugly wicked))
		      
		      (d (punish aid rob question attack abduct buy-slave hire)
		       (adulterous armed busy crafty destitute disguised drunken foolish greedy happy lovesick mad needy
			powerful repentant runaway skillful wealthy wicked wise))
		      
		      (e (examine take use open avoid sneak hire-help enter)
		       (ancient fabulous glittering guarded hidden jeweled minor mysterious ruined secret small strange wonderful))
		      (f (pray avoid wait cry-out drink examine travel hide)
		       (beautiful black dark house huge magical mild mysterious mystic rock sand terrible treacherous))
		      (g (pray-for-guidance wait-for-help cry-out-for-help examine-surroundings set-forth hide-safely)
		       (badly))
		      (h (grovel converse trick bargain attack flee avoid)
		       (pursuing vengeful))
		      (i (honor attack avoid aid rob follow question pray)
		       (blind bloodthristy con fearful friendly greedy hungry mad malicious merry multitudinous old sad strange wicked))
		      (j (pray study capture attack follow aid seek-aid hide)
		       (dark egg-of enchanted fine flying ghostly horrible hungry talking unkown))
		      (k (grovel honor bribe converse trick attack attempt-to-escape wait)
		       (friendly foolish ugly crafty mad wicked))
		      (l (attack aid rob avoid barter honor court abduct hire)
		       (beautiful cheating destitute disguised enchanted foolish friendly garrulous handsome imprisoned lonely lost lovesick
			mad powerful puissant vengeful wealthy whirling wicked))
		      (m (grovel aid avoid bargain attack trick)
		       (all-powerful angry beautiful demonic evil kindly learned lovesick noble trapped vengeful))
		      (n (avoid pray attack bargain examine enter seek-aid aid)
		       (ape-island barber crystal-palace dendan elephant elephants-graveyard islands-of-camphor lion magnetic-mountain
			palace-of-100-closets pavilion-of-the-black-giant pearl-diving rhino serpent sex-change-spring valley-of-dogs volcano warfleet))
		      (o (grovel aid avoid bargain attack trick hire)
		       (beautiful bloodthirsty cold crafty mad mighty practical-joker))))

;;; List of the indexes, Each list is a row
(defparameter *Index-list* '((a (236 185 2243 322 2258 198 224 186 209 236 318 185 185 185 186 222 280 262 271 198 236)
			      (2237 204 203 2249 293 201 204 2198 293 2237 2201 189 307 286 202 204 1640 266 1484 1484 2201)
			      (231 1496 241 2252 2261 1496 226 231 214 231 277 2216 231 229 214 226 277 214 277 256 231)
			      (233 384 382 326 517 263 233 233 515 2350 1419 2207 233 385 2350 263 518 263 263 217 379)
			      (303 2231 245 954 295 2231 2225 235 2225 303 320 186 308 287 235 209 274 265 274 236 248)
			      (2234 950 195 324 229 195 228 195 218 1487 218 950 195 195 2222 229 2195 259 1487 258 218)
			      (302 206 244 2228 206 192 221 238 211 302 2198 187 309 187 302 283 272 267 272 192 1475)
			      (298 2240 2246 2255 297 194 227 214 213 214 298 2213 214 290 298 213 2204 1481 215 254 252)
			      (301 185 198 321 201 200 223 236 209 301 319 185 306 287 203 199 270 321 270 1477 249))
			     
			     (b (341 330 336 346 335 1661 345 334 330 329 338 340 1632 333 341 332 1643 343)
			      (1639 2198 2326 358 353 361 2356 1633 358 350 352 1636 203 1652 1642 360 293 355)
			      (1625 374 2324 370 241 369 364 214 214 214 368 1493 375 372 364 371 1629 365)
			      (381 233 2399 381 382 385 380 233 378 233 263 262 384 379 518 1419 2399 262)
			      (2376 392 397 345 1658 1629 264 395 392 388 2201 280 396 249 271 332 390 262)
			      (1472 2195 229 420 425 1629 218 2359 420 229 421 215 2384 420 217 419 1646 422)
			      (435 437 336 238 329 187 346 301 2387 302 221 439 206 301 440 433 431 266)
			      (1490 415 226 1411 408 399 411 400 1685 401 343 406 401 405 409 402 398 412)
			      (1627 445 451 392 449 361 341 453 434 388 341 341 397 332 1640 444 391 403))

			     (c ( 463 1858  461 1906 1915  421 1888  418 1879 1924  462 1867  463  465  467  424 1900  461  461  462)
			        ( 507  353  204  186 1918  500 1891 1927  509  506  503  505  199  502 1933 1936 1903  508  508  348)
			        (1864 1861 1921 1909  227  494  491  365  493  491  491  497  488  495  489  215 1136  492  492  487)
			        ( 518  517  512  385  382  515  384  514  233  263  512  381  514  385 1610  516  518  512  513  382)
			        ( 524  526  523  457  245  952  457 1414  235  521  458  621  209 1873  308  361  280  456  235  525)
			        ( 529  324  195 1912  531  461 1894  427 1882 1380  259 1870  229  530  229  424  258  195  229  258)
			        ( 474  475 2027  480  471  479  939  483  478  480  874  482  472  484  470  484  476  478 2027  474)
			        ( 541  403  396  534  540 1885 1897 1930  537  543  535  541  392 1876  388 1939  448  534  537  539))
			     
			     (d (546 1616 2264 462 461 2267 461 461 462 461 467 2270 461 2273 2276 547 2279 2282 464 2285)
			      (567 199 560 2288 199 557 480 508 19 202 202 353 204 2291 556 312 558 2294 355 509)
			      (578 1616 574 1864 1496 364 487 227 256 231 489 370 1909 229 576 573 1625 214 227 229)
			      (567 563 2315 523 521 565 952 1873 523 235 308 2297 521 248 305 313 347 270 524 236)
			      (551 553 195 550 1498 531 195 461 552 2222 2493 324 2382 1470 2303 549 427 218 258 2306)
			      (585 1619 297 2309 588 2246 290 290 581 587 584 290 297 2204 589 587 2312 214 214 252)
			      (602 594 594 594 N/A 2353 599 598 599 594 605 596 5990 601 N/A 601 N/A N/A 595 592)
			      (1613 403 2315 538 537 448 1885 223 538 289 388 1939 396 446 388 388 570 2586 448 332))
			     
			     (e (1113 1110 1065 1101 1115 1138 1095 1139 1114 1141 1068 1066 1067)
			      (2143 1105 1079 1104 2143 2032 1098 2032 2134 2032 1078 1080 1081)
			      (2146 2149 1075 2146 2146 2035 2038 2035 2137 2035 1076 1074 1073)
			      (2029 1071 1070 1143 2029 1148 2041 1148 2140 1143 2041 1071 1072)
			      (221O 2332 1091 2332 2210 2219 2332 2219 2210 2219 1088 1089 1090)
			      (1118 1108 1150 1102 1116 1151 1096 1150 1116 1142 1622 1622 1623)
			      (1124 1105 1084 1103 1123 1154 1097 1155 1125 1156 1085 1083 1082)
			      (1129 2131 2131 2131 1130 1147 2131 1146 1128 1144 2044 2044 2044))

			     (f (662 751 639 680 752 705 694 638 727 629 755 703 671)
			      (2421 737 642 683 773 710 697 2421 711 634 2171 2171 677)
			      (664 748 643 682 747 707 694 645 729 630 758 701 666)
			      (659 741 658 691 740 716 625 657 734 631 756 2174 659)
			      (2152 650 650 2165 2180 718 2180 648 2183 2186 2186 2183 2180)
			      (661 744 644 685 745 713 695 644 713 2177 2177 713 667)
			      (674 2158 654 688 2158 2168 2189 653 2192 634 760 2189 669)
			      (2155 2161 642 682 2162 709 696 645 731 635 759 699 2162))
			     
			     (g (608) (616) (625) (621) (612) (617))
			      
			     (h (1588 1588)
			      (1589 2318)
			      (1590 2300)
			      (1591 1607)
			      (1594 1435)
			      (1597 1596)
			      (1598 380))

			     (i (986 2059 1996 2092 1042 1049 2008 2092 1041 2050 2059 976 1027 1004 1021)
			      (2116. 969 996 1062 2122 1052 1035 1061 969 963 969 2116 2018 1002 1015)
			      (1008 971 999 2086 863 771 1032 2074 1039 871 973 1013 1011 1000 1019)
			      (98 2047 993 1055 1645 1048 1028 1058 1852 957 2047 990 1028 2065 1021)
			      (982 2056 995 2338 2125 1051 2011 2098 2379 964 2056 980 2012 2071 1016)
			      (983 968 1999 2336 2341 2077 1034 2089 2347 964 966 979 2021 2335 2119)
			      (985 2053 2002 1055 1043 2083 2015 2095 1043 2128 960 977 1026 1001 1023)
			      (989 972 2005 1057 2329 2080 1030 1058 1038 2062 2062 2024 1030 2068 1849))

			     (j (912 944 930 876 2424 930 912 929 911 784)
			      (914 943 904 2427 947 932 2430 927 905 780)
			      (243 941 893 936 2436 2439 2442 924 891 936)
			      (881 2445 895 2448 883 879 879 923 910 897)
			      (916 2451 901 934 885 900 915 2454 908 899)
			      (2457 2460 889 922 2463 888 2466 926 890 781)
			      (9153 2469 786 2598 2472 919 2475 2478 907 785)
			      (913 944 903 868 868 931 914 929 905 903))
			     
			     (k (1501 1503 1505 1507 150 1511)
			      (1514 1516 1518 1520 1522 1524)
			      (1527 1529 1531 1533 1535 1537)
			      (1540 1542 1544 1546 1548 1550)
			      (1553 1554 1555 1556 1557 1558)
			      (1561 1565 1567 1563 1569 1570)
			      (1573 1574 1576 1577 1575 1578)
			      (1581 1581 1581 1581 1581 1581))
			     
			     (l (2592 858 529 530 418 461 2481 461 259 2484 2487 2490 2493 550 428 819 259 218 800 195)
			      (2595 855 2288 310 295 558 478 2496 563 189 304 286 203 355 2499 2502 265 2505 2508 199)
			      (231 860 2511 241 497 226 230 214 231 2514 493 229 489 487 374 817 811 277 576 256)
			      (233 721 384 721 724 722 233 515 765 766 385 767 768 515 724 724 263 769 724 263)
			      (845 854 2517 2520 2523 848 846 838 846 391 2526 826 388 2201 280 2529 808 792 796 1855)
			      (301 2532 2535 565 866 2538 236 209 301 186 306 286 203 341 249 270 806 272 795 198)
			      (301 851 206 244 283 221 238 210 834 187 309 824 822 2541 441 439 267 272 2544 192)
			      (298 581 2547 2550 297 228 252 213 585 2553 290 589 583 214 2556 2559 2562 789 799 254)
			      (2565 2568 396 2571 2574 523 842 837 841 2577 831 829 388 2580 2583 814 803 2586 2589 539))

			     (m (341 1588 2407 1463 1673 1460 334 1457 1588 2402 343)
			      (1688 1601 2415 1679 1664 1676 1667 1453 2396 1682 1416)
			      (1422 1598 2412 382 1423 1419 1419 2412 379 2399 380)
			      (341 1607 2415 344 1682 395 392 1456 248 390 2376)
			      (1691 1594 2410 1670 1436 1426 1429 2410 1435 2404 422)
			      (1694 1604 2418 1449 1444 1447 1694 2418 1439 398 1450))

			     (n (1133 1167 1133 1180 1133 1133 1133 1203 1209 1133 1223 1133 1235 1241 1246 1133 1133 1260)
			      (1728 1169 1715 1181 1186 1948 1754 1204 2101 1777 1224 1804 1236 1242 1822 1253 1266 1261)
			      (1731 1165 1718 1179 1188 1951 1945 1202 1212 1780 1221 776 1234 1240 1825 1255 1972 1960)
			      (1734 1168 1942 1706 1697 1954 1199 1206 2104 1783 1225 1807 1837 1810 1828 1987 1975 1258)
			      (1162 1742 1172 1182 1185 1191 1759 1205 1211 1215 1792 1230 1237 1243 1247 1252 1264 1259)
			      (1737 1745 1175 1709 1700 1192 1762 1768 2107 1218 1795 1231 1840 1813 1248 1251 1978 1963)
			      (1739 1748 1722 1178 1187 1194 1765 1771 2110 1786 1798 1228 1843 1816 1831 1990 1981 1966)
			      (1159 1751 1725 1712 1703 1957 1197 1774 2113 1789 1801 1269 1846 1819 1834 1993 1984 1969))

			     (o (330 344 347 1465 338 2376 338)
			      (2393 354 354 358 353 1638 2362)
			      (1419 1422 2344 381 515 721 382)
			      (845 281 394 392 2201 280 2364)
			      (1655 427 18 529 550 1432 2367)
			      (1468 343 414 1411 2390 1445 2370)
			      (445 341 447 2321 341 1649 2373))))

