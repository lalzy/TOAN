(defparameter *book-of-tales* '((236 (desc "The {other} is quite taken by your humility and charm and converses with you for many an hour. \"There is a legend I know,\" {gender} says, \"about a mysterious kingdom beneath the waves...\"")
				 (no-skill "You find the tale delightful, but see no value in it [S1]")
				 (skill scholarship storytelling "The tale {gender} tells enables you to find this wonderous kingdom [D1/S1]/Opportunity to enter the Undersea Kingdom"))
				(2237 (desc "Stricken by the {other}'s beauty, you rush to offer  your services. However, the {other}'s life is a constant whirl of parties, admirers, and courtiers")
				 (no-skill "You spend some days in their orbit, but are never able to get more than a generous smile and friendly glance. Soon you take your leave, having learned something of the ways of polite society. [S1/Courtly Graces]")
				 (skill  Courtly-graces "With adroit diplomacy, and silver tounge you help to smooth their way for a time. From the experience you garner their favor and a host of useful connections. [D1/S2/W+1(Max: Princely)]"))))

; TEst - Par:22, Res:5, Grove(0)


;; Just to give feedback
(format t "loaded successfully")
