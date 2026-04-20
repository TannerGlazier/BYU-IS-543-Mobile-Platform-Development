//
//  SampleRecipes.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/16/23.
//

import Foundation

let sampleRecipes = [
    Recipe(
        title: "Pfeffernüsse",
        subtitle: "Spicy Gingerbread Cookies",
        summary: "*Adapted for high-altitude baking.  This is my favorite Christmas cookie.*",
        course: "Dessert",
        cuisine: "German",
        difficultyLevel: "Intermediate",
        author: "",
        duration: "",
        servings: "48",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 320, unit: "g", name: "bread flour"),
                    Ingredient(sequence: 2, quantity: 30, unit: "g", name: "almond meal"),
                    Ingredient(sequence: 3, qualifier: "scant", quantity: 0.5, unit: "tsp", name: "baking soda"),
                    Ingredient(sequence: 4, quantity: 0.25, unit: "tsp", name: "salt"),
                    Ingredient(sequence: 5, quantity: 4, unit: "tsp", name: "Lebkuchengewürz"),
                    Ingredient(sequence: 6, quantity: 0.5, unit: "tsp", name: "ground ginger*"),
                    Ingredient(sequence: 7, quantity: 0.25, unit: "tsp", name: "white pepper"),
                    Ingredient(sequence: 8, quantity: 0.125, unit: "tsp", name: "black pepper*"),
                ],
                header: "Dry Team",
                text: """
                    Try substituting ammonium bicarbonate (baker's ammonia) for the \
                    baking soda.  Some recipes use ~10-15 ml rum (2-3 tsp.) to dissolve \
                    ½ tsp. baker's ammonia.
                    """
            ),
            RecipeSection(
                sequence: 2,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 100, unit: "g", name: "brown sugar"),
                    Ingredient(sequence: 2, quantity: 113, unit: "g", name: "honey"),
                    Ingredient(sequence: 3, quantity: 71, unit: "g", name: "unsalted butter", alternateQuantity: 5, alternateUnit: "Tbsp"),
                    Ingredient(sequence: 4, quantity: 50, unit: "g", name: "heavy cream", alternateQuantity: 3, alternateUnit: "Tbsp"),
                    Ingredient(sequence: 5, quantity: 25, unit: "g", name: "molasses*", alternateQualifier: "1+ Tbsp."),
                    Ingredient(sequence: 6, quantity: 2, unit: "large", name: "eggs"),
                ],
                header: "Wet Team",
                text: """
                    Some recipes add candied orange and lemon peel (~30 g each), and \
                    the zest of a lemon to the wet team.  Especially consider this when \
                    glazing with a non-lemon-based glaze.

                    *Molasses is not in the original recipe.  For a lighter flavor, drop \
                    the molasses, increasing the honey by a corresponding amount.  You \
                    can similarly reduce the amount of brown sugar.
                    """
            ),
            RecipeSection(
                sequence: 3,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 300, unit: "g", name: "powdered sugar"),
                    Ingredient(sequence: 2, quantity: 4, unit: "Tbsp", name: "hot water or lemon juice and zest", notes: "I prefer lemon juice over hot water"),
                ],
                header: "Glaze:",
                text: "See notes below for an alternative glaze recipe."
            ),
            RecipeSection(
                sequence: 4,
                header: "Instructions",
                text: """
                    1. Mix the dry team in a small bowl.

                    2. The wet team except egg goes in a saucepan. \
                    Heat, stirring frequently until melted and sugar dissolved \
                    (do not boil). Let  sit for 5 minutes.

                    3. Mix in the dry team and then the egg. Seal in cling wrap; \
                    refrigerate 24-48 hours. Time lets the dough blend and mature.

                    4. Roll into two ¾-inch snakes then cut into ¾-inch slugs \
                    (~17g). Roll in balls and place on silicon or parchment \
                    lining. Chill for 20-30 minutes.

                    5. Bake at 375 degrees for ~10 minutes. Cool completely, \
                    dip in glaze. You can thin the glaze with hot water (or \
                    lemon juice) as desired.

                    *To reduce the amount of kick to these cookies, reduce or \
                    eliminate the ginger and black pepper.
                    """
            )

        ],
        notes: """
            Simple glaze is traditional, but you could try decorating with a \
            chocolate drizzle, orange zest, or lemon zest.  I prefer a glaze \
            made with lemon juice and the lemon zest mixed in.

            The high-altitude adjustments I made include using bread flour in \
            place of all-purpose flour, increasing the amount of flour and \
            almond meal, slightly decreasing the amount of baking soda, \
            slightly increasing the amount of butter and heavy cream, and \
            adding an egg.  And at high altitude you need to bake at a higher \
            temperature for a shorter time.  Using baker's ammonia in place of \
            baking soda also helps create a better dome shape.  I've tweaked \
            the spices by adding molasses while reducing the brown sugar and \
            adding ground ginger and black pepper.

            Some recipes add rum (~10 ml), candied orange and lemon peel (~30 g each), \
            and the zest of a lemon to the wet team.  It is traditional to dissolve the \
            baker's ammonia in rum.  (For example, see \
            [My German Recipes](https://mygerman.recipes/peppernuts-pfeffernusse/). \
            That recipe also  suggests rum extract in the glaze of 250 g powdered sugar \
            and 2 Tbsp. milk, combined with some rum extract.  It further suggests \
            dipping the bottoms of the frosted Pfeffernüsse in melted semisweet chocolate.)

            Adapted from [The Daring Gourmet's Pfeffernüsse recipe]\
            (https://www.daringgourmet.com/pfeffernuesse-german-iced-gingerbread-cookies/).
            """,
        isFavorite: true
    ),
    Recipe(
        title: "Nürnberger Elisenlebkuchen",
        subtitle: "German Lebkuchen",
        summary: "*Melody calls these a \"a party in your mouth\". It's a Christmas favorite.*",
        course: "Dessert",
        cuisine: "German",
        difficultyLevel: "Intermediate",
        author: "Kimberly Killebrew",
        duration: "",
        servings: "35",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 5, unit: "large", name: "eggs"),
                    Ingredient(sequence: 2, quantity: 275, unit: "g", name: "packed brown sugar"),
                    Ingredient(sequence: 3, quantity: 120, unit: "g", name: "honey"),
                    Ingredient(sequence: 4, quantity: 1, unit: "tsp", name: "vanilla extract"),
                    Ingredient(sequence: 5, quantity: 225, unit: "g", name: "almond meal"),
                    Ingredient(sequence: 6, quantity: 225, unit: "g", name: "hazelnut meal"),
                    Ingredient(sequence: 7, quantity: 0.25, unit: "tsp", name: "salt"),
                    Ingredient(sequence: 8, quantity: 0.5, unit: "tsp", name: "baking powder"),
                    Ingredient(sequence: 9, quantity: 3, unit: "tsp", name: "Lebkuchengewürz"),
                    Ingredient(sequence: 10, quantity: 115, unit: "g", name: "candied lemon peel"),
                    Ingredient(sequence: 11, quantity: 115, unit: "g", name: "candied orange peel"),
                    Ingredient(sequence: 12, quantity: 1, unit: "cup", name: "all-purpose flour", notes: "to coat the candied peel"),
                    Ingredient(sequence: 13, quantity: 0, unit: "", name: "Backoblaten, 70mm (1 per cookie)"),
                    Ingredient(sequence: 14, quantity: 0, unit: "", name: "blanched whole almonds cut in half lengthwise"),
                ]
            ),
            RecipeSection(
                sequence: 2,
                ingredients: [
                    Ingredient(sequence: 15, quantity: 85, unit: "g", name: "quality dark or milk chocolate"),
                    Ingredient(sequence: 16, quantity: 1, unit: "Tbsp", name: "coconut oil"),
                ],
                header: "Chocolate Glaze:",
                text: "**Directions:** Place chocolate and oil in a small bowl and microwave stirring occasionally, until melted. Use immediately. If glaze becomes firm, reheat in the microwave."
            ),
            RecipeSection(
                sequence: 3,
                ingredients: [
                    Ingredient(sequence: 17, quantity: 120, unit: "g", name: "sifted powered sugar"),
                    Ingredient(sequence: 18, quantity: 3, unit: "Tbsp", name: "water"),
                ],
                header: "Sugar Glaze:",
                text: "**Directions:** Place sugar and water in a small bowl and stir until smooth."
            ),
            RecipeSection(
                sequence: 4,
                header: "Instructions",
                text: """
                    1. Preheat the oven to 300°F.
                    2. Toss the candied lemon and orange peel with about ¼ cup all-purpose flour to \
                    keep it from sticking together and then pulse in a food processor until finely \
                    minced. Set aside.
                    3. In a large mixing bowl, beat the eggs until foamy. Add the sugar, honey and \
                    vanilla extract and beat until combined.
                    4. Add the ground almonds and hazelnuts, salt, baking powder, Lebkuchengewürz, \
                    and candied lemon and orange peels and stir vigorously until thoroughly combined. \
                    (You can use a stand mixer fitted with the paddle attachment and beat for about \
                    2 minutes). The mixture will be wet but if it is too thin to scoop onto the \
                    oblaten add some more almond or hazelnut meal.
                    5. Scoop the mixture onto the Backoblaten, smoothing down the top and leaving \
                    just a slight space around the edges. Set them on a lined cookie sheet. (They \
                    can be made without the Backoblaten, but it's easy enough to find Backoblaten \
                    on Amazon.)
                    6. Bake on the middle rack of the oven for 25-28 minutes. Remove the cookie sheet \
                    and allow to cool completely.
                    7. Once cooled, place a wire rack over a cookie sheet (to catch the drippings). \
                    Dip half the Lebkuchen in the chocolate glaze and half in the sugar glaze, letting \
                    the excess drip back into the bowl and then place the Lebkuchen on the wire rack. \
                    Arrange 3 almonds on each Lebkuchen while the glaze is still wet. Let the Lebkuchen \
                    dry completely until the glaze is hardened.
                    8. Keep stored in an airtight container. Will keep for several weeks and the flavor \
                    improves with time.
                    """
            )
        ],
        notes: "",
        isFavorite: true
    ),
    Recipe(
        title: "Magenbrot",
        subtitle: "German Gingerbread Bites",
        summary: """
                *The ever popular gingerbread treats found at every German Christmas \
                market!  Flavored with warming spices, honey, hazelnuts, orange, and \
                chocolate, these gingerbread cookies are absolutely delicious!*
                """,
        course: "Dessert",
        cuisine: "German, Swiss",
        difficultyLevel: "Intermediate",
        author: "Kimberly Killebrew",
        duration: "prep 20 min., cook 30 min., drying 36 hrs.",
        servings: "60 pieces",
        calories: "77 kcal",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 125, unit: "g",  name: "honey", alternateQuantity: 1/3, alternateUnit: "cup"),
                    Ingredient(sequence: 2, quantity: 150, unit: "g", name: "sugar", alternateQuantity: 0.75, alternateUnit: "cup"),
                    Ingredient(sequence: 3, quantity: 118, unit: "ml", name: "water", alternateQuantity: 0.5, alternateUnit: "cup"),
                    Ingredient(sequence: 4, quantity: 0, unit: "", name: "zest of one lemon"),
                    Ingredient(sequence: 5, quantity: 270, unit: "g", name: "all-purpose flour", alternateQuantity: 2.25, alternateUnit: "cup"),
                    Ingredient(sequence: 6, quantity: 145, unit: "g", name: "whole-wheat flour", alternateQuantity: 1.25, alternateUnit: "cup"),
                    Ingredient(sequence: 7, quantity: 56, unit: "g", name: "hazelnut or almond meal", alternateQuantity: 0.5, alternateUnit: "cup"),
                    Ingredient(sequence: 8, quantity: 21, unit: "g", name: "cocoa powder", alternateQuantity: 3, alternateUnit: "Tbsp"),
                    Ingredient(sequence: 9, quantity: 2, unit: "tsp", name: "baking powder"),
                    Ingredient(sequence: 10, quantity: 1, unit: "tsp", name: "baking soda"),
                    Ingredient(sequence: 11, quantity: 2, unit: "tsp", name: "Lebkuchengewürz"),
                    Ingredient(sequence: 12, quantity: 1, unit: "tsp", name: "ground cinnamon"),
                    Ingredient(sequence: 13, quantity: 0.5, unit: "tsp", name: "salt"),
                    Ingredient(sequence: 14, quantity: 20, unit: "g", name: "finely minced candied orange peel", alternateQuantity: 3, alternateUnit: "Tbsp"),
                    Ingredient(sequence: 15, quantity: 118, unit: "ml", name: "milk", alternateQuantity: 0.5, alternateUnit: "cup", notes: "start with less and add more as needed; if dough is too dry add a little extra"),
                ]
            ),
            RecipeSection(
                sequence: 2,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 400, unit: "g", name: "granulated sugar", alternateQuantity: 2, alternateUnit: "cup"),
                    Ingredient(sequence: 2, quantity: 118, unit: "ml", name: "water", alternateQuantity: 0.5, alternateUnit: "cup"),
                    Ingredient(sequence: 3, quantity: 7, unit: "g", name: "cocoa powder", alternateQuantity: 1, alternateUnit: "Tbsp"),
                    Ingredient(sequence: 4, quantity: 1, unit: "tsp", name: "vanilla extract"),
                ],
                header: "For the Glaze:"
            ),
            RecipeSection(
                sequence: 3,
                header: "Instructions",
                text: """
                    1. Place honey, sugar, water, and lemon zest in a small saucepan and \
                    simmer until the sugar is dissolved.
                    2. Combine the flours, nut meal, cocoa powder, baking powder, baking \
                    soda, Lebkuchengewürz, cinnamon and salt in a large mixing bowl. Stir \
                    in the candied orange peel. Stir the warm honey syrup and the milk \
                    into the flour and stir to combine until a stiff dough forms. Start \
                    with less milk and add more as needed if the dough is too dry. Cover \
                    and let sit overnight at room temperature or up to 24 hours to allow \
                    the flavors time to mature.
                    3. Preheat the oven to 350°F (175°C).
                    4. Divide the dough into 4 equal pieces and roll each piece into logs \
                    about 1 to 1 ½ inches in diameter. Place the logs about 3 inches \
                    apart on a lined baking sheet. Gently press to slightly flatten the \
                    logs. Bake for 15 minutes. Let cool a few minutes and then, while the \
                    gingerbread is still warm, slice each log at a diagonal into 1 to 1 ½ \
                    inch wide pieces. Let the Magenbrot air dry at room temperature \
                    overnight or up to 24 hours.

                    **To Make the Glaze:**

                    5. Place the sugar and water in a small saucepan and, using a candy \
                    thermometer, simmer until the mixture reaches 234°F (113°C). If you \
                    don't get it fully up to this temperature the glaze will not set and \
                    will be wet and sticky. If the temperature far exceeds 234°F the \
                    glaze will be dry and crumbly. Get it as close to 234°F as possible \
                    (a little over is better than a little under).
                    6. Once the mixture reaches 234°F remove it from the heat and whisk \
                    in the cocoa powder and vanilla extract.
                    7. Place the Magenbrot in a large mixing bowl and immediately pour \
                    over the hot glaze, stirring to evenly coat the Magenbrot. Place the \
                    wet Magenbrot on a lined baking sheet in a single layer so they are \
                    not touching each other and let them dry completely.
                    8. Once completely dry, store the Magenbrot in an airtight container \
                    where it will keep for 2-3 weeks.

                    Makes about 60 pieces depending on the width.
                    """
            )
        ],
        notes: """
            Note that at altitude, you need to subtract about 2°F for every 1000 \
            feet above sea level.  The most accurate way to measure is to boil water for \
            five minutes and test the temperature.  At sea level, water boils at 212°F, \
            so subtract your boiling temperature from 212 to know how much you need to \
            adjust your candy making temperature.  In Utah Valley, 225°F is about the \
            right temperature for the Magenbrot glaze.

            A Swiss recipe for Magenbrot \
            (<https://www.confiserie.ch/bachmann/medien/rezepte-suess/magenbrot/>) \
            calls for a glaze with 80g dark chocolate, 80g butter, 5-6 Tbsp. water, \
            1 Tbsp. cocoa powder, and 250g powdered sugar.  The chocolate, butter, and \
            water are warmed, then the cocoa powder and powdered sugar are sifted in, \
            and the mixture is stirred till smooth.  If you're having trouble getting the \
            right glaze consistency with the Daring Gourmet's recipe, try this Swiss \
            approach.
            """,
        isFavorite: true
    ),
   Recipe(
        title: "Lebkuchengewürz",
        subtitle: "German Gingerbread Spice",
        summary: """
            *THE essential ingredient to authentic tasting Lebkuchen, \
            Pfeffernüsse and more, absolutely NOTHING compares to the bold \
            and vibrant flavors of homemade Lebkuchengewürz!*
            """,
        course: "Condiment",
        cuisine: "German",
        difficultyLevel: "Simple",
        author: "Kimberly Killebrew",
        duration: "prep 5 min.",
        servings: "4 tablespoons",
        calories: "",
        sections: [
            RecipeSection(sequence: 1, ingredients: [
                Ingredient(sequence: 1, quantity: 2.5, unit: "Tbsp", name: "ground cinnamon", ratio: 30),
                Ingredient(sequence: 2, quantity: 2, unit: "tsp", name: "ground cloves", ratio: 8),
                Ingredient(sequence: 3, quantity: 0.5, unit: "tsp", name: "ground allspice", ratio: 2),
                Ingredient(sequence: 4, quantity: 0.5, unit: "tsp", name: "ground coriander", ratio: 2),
                Ingredient(sequence: 5, quantity: 0.5, unit: "tsp", name: "ground green cardamom", ratio: 2),
                Ingredient(sequence: 6, quantity: 0.5, unit: "tsp", name: "ground ginger", ratio: 2, notes: "I doubled the ginger"),
                Ingredient(sequence: 7, quantity: 0.5, unit: "tsp", name: "ground star anise", ratio: 2),
                Ingredient(sequence: 8, quantity: 0.25, unit: "tsp", name: "ground mace", ratio: 1),
                Ingredient(sequence: 9, quantity: 0.25, unit: "tsp", name: "ground nutmeg", ratio: 1),
            ]),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Combine the spices together and store in an airtight jar \
                    in a cool, dark place for up to one year.

                    2. For superior flavor results, grind these spices from \
                    toasted and freshly ground whole spices. Simply heat a dry \
                    skillet over medium heat and toast the spices in it until \
                    very fragrant. Be careful not to scorch the spices or they \
                    will become bitter. Using the freshly ground blend within \
                    a few days is optimal.
                    """
            )
        ],
        notes: """
            Some spices, like ginger and mace, may not be readily available \
            in whole form. You can buy ground ginger and ground mace instead.

            <https://www.daringgourmet.com/homemade-lebkuchengewuerz-german-gingerbread-spiceblend/>
            """
    ),
    Recipe(
        title: "Candied Orange and Lemon Peels",
        subtitle: "",
        summary: """
            *Candied citrus peel is easy to make yourself, contains no \
            chemicals or additives, and tastes MUCH better than store-bought!*
            """,
        course: "Candy, condiment, ingredient",
        cuisine: "All",
        difficultyLevel: "Simple",
        author: "Kimberly Killebrew",
        duration: "prep 20 min, cook 20 min, air drying 1-2 days",
        servings: "",
        calories: "",
        sections: [
            RecipeSection(sequence: 1, ingredients: [
                Ingredient(sequence: 1, quantity: 3, unit: "", name: "Valencia or navel oranges"),
                Ingredient(sequence: 2, quantity: 4, unit: "", name: "lemons"),
                Ingredient(sequence: 3, quantity: 0, unit: "", name: "(Can use the equivalent of grapefruits, Meyer lemons and limes, or any citrus of your choice, thoroughly washed and scrubbed; as citrus is highly sprayed, I recommend using organic)"),
                Ingredient(sequence: 4, quantity: 2, unit: "cup", name: "sugar"),
                Ingredient(sequence: 5, quantity: 1, unit: "cup", name: "water"),
                Ingredient(sequence: 6, quantity: 0, unit: "", name: "Fine granulated sugar for coating")
            ]),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Slice both ends of the citrus fruits. Cut the peel on \
                    each into 4 or more vertical segments, depending on the \
                    size of the fruit. Peel off each segment of rind. (You can \
                    remove a little of the white pith, though not necessary. \
                    The pith is bitter, but the blanching process below will \
                    help reduce the bitterness. Note that if you remove the \
                    white pith, the thinner the peels are, the harder and more \
                    leathery they will be when they’re candied.) Slice the \
                    peels into ¼ inch wide strips. (Keep the peeled citrus for \
                    eating, cooking, juicing, etc.)
                    2. Boil the peels in a pot of water for 15 minutes. Drain \
                    the peels in a colander, rinse and then drain again. \
                    Discard the water from the pot.
                    3. Repeat this process one or two more times to reduce the \
                    bitter flavor [if desired].
                    4. Add the fresh water and sugar to the pot and bring it to \
                    a boil. Boil it for a couple of minutes until the sugar is \
                    dissolved. Add the citrus peels, reduce the heat to low and \
                    simmer for 15-20 [*I did 20*] minutes, stirring \
                    occasionally, until the peels become translucent and the \
                    syrup becomes lightly syrupy.
                    5. Use a slotted spoon to remove a few of the peels at a \
                    time and let the excess syrup drip off for a few seconds. \
                    Place the hot, wet peels in the bowl of sugar and toss to coat.
                    6. Spread the candied citrus peels out on a wire rack to \
                    cool and dry completely, 1-2 days.
                    7. Stored in an airtight container in a cool, dry place, \
                    the candied citrus peel will keep for at least a month. \
                    They'll keep even longer in the fridge and for a few \
                    months frozen.
                    """
            )
        ],
        notes: """
            If you find your candied citrus peel gets hard  after a while don't \
            worry—they will soften up beautifully as they bake in whatever \
            recipe  you add them to!

            To keep the candied peels even softer you can limit the drying \
            time, skip the final sugarcoating step and put the peels in a Ziplock \
            bag and either refrigerate or freeze them. Don’t discard the citrus \
            syrup! [*Actually, I do. –SWL*] This is a wonderful citrus-flavored \
            simple syrup to add to your drinks for a wonderful kick of citrus \
            flavor! If you'd like to make more candied citrus peel, simply \
            increase the amount of water and sugar by the same 1:2 ratio.

            *You can also dip orange peels in dark chocolate to make homemade \
            orange sticks like the French did.*

            <https://www.daringgourmet.com/how-to-make-candied-orange-and-lemon-peel/>
            """
    ),
    Recipe(
        title: "Zimtsterne",
        subtitle: "German Cinnamon Stars",
        summary: """
            *Christmas is incomplete without one of Germany's most beloved \
            holiday cookies, Zimtsterne. Made with nuts and cinnamon and a \
            snowy white icing, they have the most fabulous texture and \
            nostalgic flavor.*
            """,
        course: "Dessert",
        cuisine: "German",
        difficultyLevel: "Intermediate",
        author: "Kimberly Killebrew",
        duration: "prep 20 min, cook 30 min, rest 10 min",
        servings: "24 cookies",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 3, unit: "", name: "large egg whites"),
                    Ingredient(sequence: 2, quantity: 240, unit: "g", name: "powdered/confectioner's sugar",
                               alternateQuantity: 2, alternateUnit: "cup"),
                    Ingredient(sequence: 3, quantity: 364, unit: "g", name: "non-blanched almond meal or hazelnut meal",
                               alternateQuantity: 3.25, alternateUnit: "cup"),
                    Ingredient(sequence: 4, quantity: 2, unit: "tsp", name: "ground cinnamon"),
                    Ingredient(sequence: 5, quantity: 1.5, unit: "tsp", name: "Vanillezucker",
                               notes: "recommended but if you can't get it simply omit"),
                    Ingredient(sequence: 6, quantity: 0.125, unit: "tsp", name: "salt")
                ]
            ),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Preheat the oven to 300°F (do not turn on the \
                    fan, it can cause the egg white topping to brown before the \
                    cookies are done). Place the rack on the bottom rung of the oven.
                    2. Beat the egg whites in a medium-sized bowl until peaks \
                    form (be careful not to overbeat the egg whites or the \
                    frosting/glaze won't turn out right). Stir in the powdered \
                    sugar until combined. Reserve 2 generous, heaping \
                    tablespoons of the egg white mixture for the glaze. [*I \
                    reserve more than that. Another recipe reserves ¾ cup.*]
                    3. Add the nuts, cinnamon, vanilla sugar and salt and beat \
                    until the dough comes together in a fairly stiff but pliable \
                    mass. If it's too soft to work with add a few more ground \
                    nuts and powdered sugar. (If the dough is too sticky, add a \
                    little more nut flour.)  [*Another recipe says to wrap the dough \
                    in plastic wrap and refrigerate for 30 minutes. Cold dough is \
                    easier to handle.*]
                    4. Press/roll the dough onto a non-stick surface sprinkled \
                    with powdered sugar to a thickness of about 1/3 inch. Use a \
                    3-inch star cookie cutter to cut out the cookies and transfer \
                    them to a lined or non-stick cookie sheet. [*I find it helps \
                    to dip the cutter in water to help it keep from sticking.*] \
                    Form the scraps of dough into a ball, roll it out again and \
                    cut cookies out of the remaining dough.
                    5. Use a pastry brush to brush on the reserved egg white \
                    mixture in a thin layer reserving enough for all of the \
                    cookies and extending the glaze out to the edges of the cookies. \
                    [*You can also use a spoon or toothpick to spread the egg white \
                    mixture to the points of the stars.*]
                    6. Bake for 15-20 minutes. Let the cookies cool completely.
                    7. The cookies can be stored in a dry, airtight container \
                    in a cool place for at least 2 weeks.
                    """
            )
        ],
        notes: """
            <https://www.daringgourmet.com/zimtsterne-german-cinnamon-star-cookies/>

            Luisa Weiss, in *Classic German Baking*, recommends letting the prepared \
            cookies sit at cool room temperature for 12 to 24 hours (the meringue will \
            be dry to the touch), then baking in a 350°F/180°C oven on the bottom rack \
            for 3-4 minutes, or until the meringue is set but still snowy white.
            """,
        isFavorite: true
    ),
    Recipe(
        title: "Tempered Chocolate",
        subtitle: "",
        summary: """
            *Tempered chocolate makes a nice finish on cookies and candies. It \
            doesn't melt as easily as untempered chocolate. Use high-quality \
            bars for best results.*
            """,
        course: "Candy, ingredient",
        cuisine: "All",
        difficultyLevel: "Intermediate",
        author: "",
        duration: "",
        servings: "",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                header: "Instructions",
                text: """
                    1. Heat chocolate to melt. Do not exceed 120°F for dark chocolate \
                    or 105°F for milk or white.
                    2. Cool to 82°F.
                    3. Reheat to 88°F to 91°F. For milk and white chocolate, reheat to \
                    85°F to 87°F.
                    4. Spread a small spoonful of chocolate on a piece of wax paper. If \
                    it looks dull or streaky, retemper the chocolate. If it dries \
                    quickly with a glossy finish and no streaks, the chocolate is \
                    in temper.

                    Once melted chocolate has been tempered, it must be used before it \
                    cools and sets. If it cools to about 84°F to 86°F and is still \
                    fairly liquid, it can be reheated to a liquid consistency. If it \
                    has completely cooled and solidified, it should be re-tempered. \
                    Heat it for 5 to 10 seconds at a time, stirring and checking the \
                    temperature before reheating. For dark chocolate, reheat to 88°F to \
                    91°F. For milk and white chocolate, reheat to 87°F to 88°F. If you \
                    keep your chocolate within these temperature ranges, it will stay \
                    in temper and be liquid enough to use.
                    """
            )
        ],
        notes: ""
    ),
    Recipe(
        title: "Chocolate Hazelnut Nougat",
        subtitle: "Nuss-Nougat Rohmasse",
        summary: """
            *Known as Nuss-Nougat Rohmasse in Germany, this chocolate
            hazelnut nougat is a popular ingredient used for fillings in
            cakes, cookies, pastries, and candies, and for glazes, frosting
            and fondants.*
            """,
        course: "Candy, ingredient",
        cuisine: "German",
        difficultyLevel: "Intermediate",
        author: "Kimberly Killebrew",
        duration: "",
        servings: "",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 200, unit: "g", name: "whole hazelnuts (use skinless, otherwise remove the skins after roasting them", alternateQuantity: 7, alternateUnit: "oz"),
                    Ingredient(sequence: 2, quantity: 200, unit: "g", name: "powdered/confectioner's sugar",
                               alternateQuantity: 7, alternateUnit: "oz"),
                    Ingredient(sequence: 3, quantity: 41, unit: "g", name: "unsalted butter or cocoa butter, melted",
                               alternateQuantity: 3, alternateUnit: "Tbsp"),
                    Ingredient(sequence: 4, quantity: 200, unit: "g", name: "bittersweet chocolate wafers or chips (minimum 60% cacao), melted", alternateQuantity: 7, alternateUnit: "oz"),
                ]
            ),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Preheat the oven to 350°F. Place the hazelnuts in a single \
                    layer on a lined baking sheet. Roast until they're golden, \
                    about 7-10 minutes. (Be careful not to over-roast or they \
                    will be bitter). If they have skins on them, place them in \
                    a clean dish towel and rub them against each other to \
                    remove the skins.
                    2. Place nuts in a food processor with the sugar and blend \
                    until the mixture comes together in a mass (resembling very \
                    thick peanut butter), about 5 minutes. Add the melted cocoa \
                    butter or butter and blend until combined, scraping down \
                    the sides as needed. Add the melted chocolate and pulse \
                    until the mixture is combined and smooth, scraping down the \
                    sides as needed.

                    Scrape the mixture into a bowl, then cover and refrigerate \
                    until it is firm. At this point you can shape it into a log, \
                    wrap and store it in the fridge or just leave it in the bowl \
                    and scoop out as needed. Made with cocoa butter it will keep \
                    for several weeks in the fridge. Made with butter it will \
                    keep for a couple of weeks. Let the nougat come to room \
                    temp before using so it will be softer and malleable.

                    Makes about 19 ounces (540 grams) of nuss-nougat rohmasse.
                    """
            )
        ],
        notes: "[Try 250g, 100g, 100g, 200g.]"
    ),
    Recipe(
        title: "Pistachio Marzipan",
        subtitle: "",
        summary: """
            *Use it for making candies and chocolates, as a filling in \
            pastries or a fondant for cakes, this delicious Pistachio Marzipan \
            takes all of 5 minutes to make!*
            """,
        course: "Candy, ingredient",
        cuisine: "Austrian, German",
        difficultyLevel: "Simple",
        author: "Kimberly Killebrew",
        duration: "prep 10 min",
        servings: "6",
        calories: "287 kcal",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 120, unit: "g", name: "very fine almond meal", alternateQuantity: 1, alternateUnit: "cup"),
                    Ingredient(sequence: 2, quantity: 50, unit: "g", name: "shelled unsalted roasted pistachios", alternateQuantity: 0.5, alternateUnit: "cup", notes: "can use raw or salted if needed"),
                    Ingredient(sequence: 3, quantity: 180, unit: "g", name: "powdered sugar", alternateQuantity: 1.5, alternateUnit: "cup"),
                    Ingredient(sequence: 4, quantity: 2, unit: "tsp", name: "quality pure almond extract"),
                    Ingredient(sequence: 5, qualifier: "1 to 2", quantity: 0, unit: "tsp", name: "rum extract", notes: "use 2 teaspoons when making Mozartkugeln"),
                    Ingredient(sequence: 6, quantity: 1, unit: "", name: "pasteurized egg white"),
                    Ingredient(sequence: 7, quantity: 0, unit: "", name: "Natural green food coloring", notes: "3-4 drops, optional")
                ]
            ),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Place the almond flour, pistachios, and powdered sugar in \
                    a food processor and pulse until combined and any lumps are \
                    broken up. Add the almond extract and rum extract and pulse \
                    to combine.

                    2. Add the egg white and process until a thick dough is \
                    formed. If the mass is still too wet and sticky, add more \
                    powdered sugar and ground almonds. Keep in mind that it \
                    will become firmer after it's been refrigerated.

                    3. If desired, add several drops of natural green food coloring.

                    4. Turn the pistachio marzipan out onto a work surface and \
                    knead it a few times. Form it into a log, wrap it up in \
                    plastic wrap and refrigerate.

                    Will keep for at least a month in the refrigerator or up to \
                    6 months in the freezer.

                    Bring to room temperature before using in any recipe.

                    Makes 13-14 ounces of pistachio marzipan.
                    """
            )
        ],
        notes: "<https://www.daringgourmet.com/pistachio-marzipan/>"
    ),
    Recipe(
        title: "Marzipan",
        subtitle: "Almond Paste",
        summary: """
            *Making your own marzipan or almond paste saves a lot of money and \
            it couldn't possibly be easier—or tastier!*
            """,
        course: "Candy, ingredient",
        cuisine: "German, Italian",
        difficultyLevel: "Simple",
        author: "Kimberly Killebrew",
        duration: "prep 5 min",
        servings: "6",
        calories: "281 kcal",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 168, unit: "g", name: "very fine blanched almond flour/meal—I recommend store-bought almond meal to ensure it is finely ground and sufficiently dry", alternateQuantity: 1.5, alternateUnit: "cup"),
                    Ingredient(sequence: 2, quantity: 180, unit: "g", name: "powdered sugar", alternateQuantity: 1.5, alternateUnit: "cup"),
                    Ingredient(sequence: 3, qualifier: "or", quantity: 1.5, unit: "cup", name: "Swerve confectioner sweetener", notes: "sugar-free and diabetic alternative"),
                    Ingredient(sequence: 4, quantity: 2, unit: "tsp", name: "quality pure almond extract"),
                    Ingredient(sequence: 5, quantity: 1, unit: "tsp", name: "quality food grade rose water"),
                    Ingredient(sequence: 6, quantity: 1, unit: "", name: "egg white", notes: "if you can't find pasteurized eggs and that is a concern to you, you can substitute liquid pasteurized egg whites ​or reconstituted powdered egg whites; vegans: use egg substitute or 4+ Tbsp. corn syrup, golden syrup, or other liquid sweetener")
                ]
            ),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Place the almond flour and powdered sugar in a food \
                    processor and pulse until combined and any lumps are broken \
                    up. Add the almond extract and rose water and pulse to \
                    combine. Add the egg white and process until a thick dough \
                    is formed. If the mass is still too wet and sticky, add \
                    more powdered sugar and ground almonds. Keep in mind that \
                    it will become firmer after it's been refrigerated.

                    2. Turn the almond marzipan out onto a work surface and \
                    knead it a few times. Form it into a log, wrap it up in \
                    plastic wrap and refrigerate.

                    Will keep for at least a month in the refrigerator or up to \
                    6 months in the freezer.

                    Bring to room temperature before using in any recipe.

                    Makes 13-14 ounces of marzipan or almond paste.
                    """
            )
        ],
        notes: """
            **Marzipan vs. Almond Paste:** Almond paste is softer and is used \
            in baked goods. Marzipan is firmer and is used in making \
            candies/chocolates or as fondant for cakes. Marzipan also uses \
            rose water. To adjust this recipe according to what you're using \
            it for, follow this recipe as instructed for almond paste (I still \
            include the rose water because it tastes amazing), or add an extra \
            ¼ cup or more of almond flour/meal until you reach a firmer \
            consistency (one that you can roll out with a rolling pin without \
            it sticking) for marzipan.

            To make a firmer Marzipan that you can shape into figures for \
            decorations, add ¼ cup or more of sugar until you reach the \
            desired level of firmness (keep in mind it will also become \
            firmer after it refrigerates).

            <https://www.daringgourmet.com/how-to-make-marzipan-almond-paste/>
            """
    ),
    Recipe(
        title: "Mozartkugeln",
        subtitle: "Layered Salzburg Candy",
        summary: """
            *The world-famous chocolate confection that originated in Salzburg, \
            Austria in 1890 in honor of Wolfgang Amadeus Mozart. Filled with \
            marzipan, pistachio, and nougat, they are irresistibly delicious!*
            """,
        course: "Dessert, candy",
        cuisine: "Austrian",
        difficultyLevel: "Intermediate",
        author: "Kimberly Killebrew",
        duration: "prep 45 min, chill 1 hour",
        servings: "30",
        calories: "Need to ask? Can't afford it.",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 2, unit: "batches", name: "marzipan"),
                    Ingredient(sequence: 2, quantity: 1, unit: "batch", name: "pistachio marzipan"),
                    Ingredient(sequence: 3, quantity: 2, unit: "batches", name: "Nuss-Nougat Rohmasse, room temperature", notes: "critical to be malleable"),
                    Ingredient(sequence: 4, quantity: 4, unit: "cup", name: "dark chocolate wafers or chips, melted", alternateQuantity: 32, alternateUnit: "oz")
                ]
            ),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Form balls and disks of ingredients. Pinch some of the \
                    pistachio marzipan and roll it into a ball using the palms \
                    of your hands. Set aside. Scoop out some of the nougat and \
                    roll it into a larger ball than the pistachio marzipan, \
                    then flatten it into a disk. Set aside. Pinch off some of \
                    the almond marzipan and roll it into a larger ball than \
                    the nougat, then flatten it into a disk. Take the pistachio \
                    marzipan ball and set it on the disk of nougat. Close the \
                    nougat around the pistachio marzipan and roll it into a \
                    ball. Now set the pistachio-enclosed nougat ball onto the \
                    disk of marzipan. Close the marzipan around the nougat \
                    ball to fully enclose it and then roll it into a ball in \
                    the palms of your hands.

                    2. Dip the kugeln in the melted chocolate coat them \
                    thoroughly and evenly, letting the excess chocolate drip off.

                    If using skewers, stick the bottom ends of the skewers into \
                    some Styrofoam to keep them upright while the kugeln are \
                    drying, making sure the kugeln don't touch each other. I \
                    recommend placing them in the fridge where they will dry \
                    more quickly which will help prevent them from sliding \
                    down the skewer over time.

                    If you're not using skewers, place the chocolate dipped \
                    skewers onto a lined cookie sheet or other surface until set.

                    To make these all the fancier you can wrap them \
                    individually with regular or gold foil.

                    These will keep for a couple of months stored in the \
                    fridge in an airtight container.

                    Makes about 30 Mozartkugeln. To make just 18, do 1 batch \
                    marzipan and cut the chocolate in half. You could also try \
                    making them smaller.
                    """
            )
        ],
        notes: "<https://www.daringgourmet.com/homemade-mozartkugeln/>"
    ),
    Recipe(
        title: "Vanillekipferl",
        subtitle: "Austrian Vanilla Crescent Cookies",
        summary: """
            *Popular throughout Europe, these shortbread cookies are of \
            Austrian origin and their vanilla-infused flavor and \
            melt-in-your-mouth texture are sure to win you over!*
            """,
        course: "Dessert",
        cuisine: "Austrian",
        difficultyLevel: "Intermediate",
        author: "Kimberly Killebrew",
        duration: "prep 15 min, bake 12 min",
        servings: "40 cookies",
        calories: "94 kcal",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 250, unit: "g", name: "all-purpose flour", alternateQuantity: 2, alternateUnit: "cup"),
                    Ingredient(sequence: 2, quantity: 227, unit: "g", name: "unsalted butter, room temperature", alternateQuantity: 1, alternateUnit: "cup"),
                    Ingredient(sequence: 3, quantity: 113, unit: "g", name: "ground walnuts, almonds, or hazelnuts", alternateQualifier: "about", alternateQuantity: 1, alternateUnit: "cup"),
                    Ingredient(sequence: 4, quantity: 1.5, unit: "tsp", name: "vanilla sugar"),
                    Ingredient(sequence: 5, quantity: 90, unit: "g", name: "powdered sugar", alternateQuantity: 0.75, alternateUnit: "cup"),
                    Ingredient(sequence: 6, quantity: 0.25, unit: "tsp", name: "salt")
                ],
                text: """
                    """
            ),
            RecipeSection(
                sequence: 2,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 60, unit: "g", name: "powdered sugar", alternateQuantity: 0.5, alternateUnit: "cup"),
                    Ingredient(sequence: 2, quantity: 1.5, unit: "tsp", name: "vanilla sugar")
                ],
                header: "For Dusting:"
            ),
            RecipeSection(
                sequence: 3,
                header: "Instructions",
                text: """
                    1. Place all of the ingredients in a large bowl and knead \
                    until thoroughly combined.  Unless you're using egg yolks \
                    the dough will be pretty dry and flaky, like shortbread \
                    cookie dough.  Shape the dough into a log and wrap with \
                    plastic wrap.  Chill in the refrigerator for at least an hour.

                    2. Preheat the oven to 350°F.

                    3. Take some of the dough out of the fridge, leaving the \
                    remaining dough wrapped in the fridge to stay cold. Cut \
                    off small pieces of the dough and shape them into \
                    crescents. Shape them into uniform sizes so they bake \
                    evenly. Place the crescents onto a non-stick or \
                    parchment-lined cookie sheet. Bake on the middle rack for \
                    12-15 minutes (depending on the size of the crescents) or \
                    until the edges begin to turn golden.

                    4. Combine the powdered sugar and vanilla sugar.  Let the \
                    cookies sit for one minute and then use a sifter to dust \
                    them with the vanilla-powdered sugar while they're still \
                    hot. Let the cookies cool completely and then give them a \
                    second dusting.
                    """
            ),
        ],
        notes: """
            Store the cookies in an airtight container in a cool place (not the \
            fridge) and these cookies will keep for 3-4 weeks (1 week if using egg).

            Vanillekipferl are shortbread cookies, meaning they're made \
            with a high butter content and generally without the \
            addition of egg.  You'll find some recipes that call for \
            eggs but traditionally they are not included.  Adding an \
            egg yolk or two does make the dough easier to work with, \
            especially for less experienced bakers, but the texture is \
            far superior without the egg; it's lighter, looser, and \
            more delicately crumbly with an almost melt-in-your-mouth \
            texture.

            <https://www.daringgourmet.com/vanillekipferl-austrian-vanilla-crescent-cookies/>
            """
    ),
    Recipe(
        title: "Bethmännchen",
        subtitle: "German Marzipan Cookies",
        summary: """
            *Delicious centuries-old German Christmas cookies that are easy to \
            make and taste wonderful!*
            """,
        course: "Dessert",
        cuisine: "German",
        difficultyLevel: "Intermediate",
        author: "Kimberly Killebrew",
        duration: "prep 5 min, cook 15 min",
        servings: "35 cookies",
        calories: "78 kcal",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 227, unit: "g", name: "marzipan", alternateQuantity: 8, alternateUnit: "oz"),
                    Ingredient(sequence: 2, quantity: 90, unit: "g", name: "powdered sugar", alternateQuantity: 0.75, alternateUnit: "cup"),
                    Ingredient(sequence: 3, quantity: 84, unit: "g", name: "ground blanched almonds/almond meal", alternateQuantity: 0.75, alternateUnit: "cup", notes: "for the sake of consistency and ensuring the almonds are dry and compact enough, I recommend using store-bought almond meal"),
                    Ingredient(sequence: 4, quantity: 42, unit: "g", name: "all-purpose flour", alternateQuantity: 1.0 / 3, alternateUnit: "cup"),
                    Ingredient(sequence: 5, quantity: 1, unit: "", name: "medium egg white"),
                    Ingredient(sequence: 6, quantity: 2, unit: "tsp", name: "rose water"),
                    Ingredient(sequence: 7, quantity: 1, unit: "", name: "medium egg yolk"),
                    Ingredient(sequence: 8, quantity: 1, unit: "", name: "blanched whole almonds, split in half", alternateQuantity: 0.75, alternateUnit: "cup", notes: "see post for pictured instructions on how to blanch and skin almonds"),
                ]
            ),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Preheat to 350°F.

                    2. Break marzipan into small pieces in a mixing bowl. Sift \
                    the powdered sugar over the marzipan and add the ground \
                    almonds, flour, rose water and egg white. Use your hands \
                    to combine the ingredients in to a dough. The dough will \
                    be somewhat sticky but it will get firm after it's sat in \
                    the fridge. If too sticky, add some more ground almonds \
                    and powdered sugar.

                    3. Wrap the cookie dough in plastic wrap and refrigerate \
                    for at least an hour.

                    4. Roll the dough into small balls, no more than 1-inch in \
                    diameter. Sprinkle your hands with a little flour or \
                    powdered sugar if the dough is too sticky. Place the balls \
                    on a lined cookie sheet and press 3 almond halves evenly \
                    around each cookie, pointed side up. Brush each cookie \
                    with the egg yolk mixture and bake for about 15 minutes \
                    until the egg wash turns golden in color.

                    5. Transfer the cookies to a wire rack to cool completely. \
                    Store in an airtight container for up to several weeks.
                    """
            )
        ],
        notes: """
            Not all marzipan is created equal.  Some use a higher ratio of \
            sugar to almonds which may result in your cookies deflating.  For \
            the best results, be sure to use the homemade marzipan.  It's \
            SUPER easy to make!

            <https://www.daringgourmet.com/traditional-german-bethmannchen-marzipan-cookies/>
            """
    ),
    Recipe(
        title: "Laugengebäck",
        subtitle: "Bavarian Soft Pretzels",
        summary: """
            *These authentic Bavarian soft pretzels are sure to be a hit with
            everyone! My kids especially enjoy the Laugenstangen form. This
            dough also makes excellent hamburger and hot dog (or bratwurst) buns.*
            """,
        course: "Bread",
        cuisine: "Austrian, German",
        difficultyLevel: "Advanced",
        author: "Stephen W. Liddle",
        duration: "",
        servings: "24 pieces",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 1124, unit: "g", name: "bread flour", bakersPercent: 90),
                    Ingredient(sequence: 2, quantity: 125, unit: "g", name: "rye flour", bakersPercent: 10),
                    Ingredient(sequence: 3, quantity: 662, unit: "ml", name: "water", bakersPercent: 53),
                    Ingredient(sequence: 4, quantity: 37.5, unit: "g", name: "lard or butter*", bakersPercent: 3),
                    Ingredient(sequence: 5, quantity: 25, unit: "g", name: "malt syrup or powder", bakersPercent: 2),
                    Ingredient(sequence: 6, quantity: 17.5, unit: "g", name: "yeast", bakersPercent: 1.4),
                    Ingredient(sequence: 7, quantity: 25, unit: "g", name: "salt", bakersPercent: 2),
                    Ingredient(sequence: 8, quantity: 25, unit: "g", name: "sourdough starter", bakersPercent: 2),
                ],
                text: """
                    *Vegan: can substitute coconut oil; the most authentic, fluffiest version is made with lard.
                    """
            ),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Combine everything in a STURDY bread mixer and knead on \
                    low for 3 minutes. Then knead on high for at least 5 minutes. \
                    (You may need to knead by hand given how stiff this dough is.)

                    2. Let the dough rest covered for 15 minutes (in the mixing \
                    bowl is fine).

                    3. Cut into desired piece weights (75-120g each). Form \
                    balls and place under damp towel. Rest 5 minutes.

                    4. For bretzel, roll into 12-inch length. For stangen, \
                    flour and roll out into 6 x 9 inch oval. For brötchen, \
                    tension the ball surface and place on pan (flatten balls a \
                    bit). For bretzel/stangen place back under damp towel.

                    5. For bretzel, roll out to 24-inch length and form \
                    bretzel. For stangen, roll up oval into log, then roll out \
                    to about 8 inch length.

                    6. Rest at room temperature for 30 minutes, covered.

                    7. Refrigerate for 1 hour or overnight.

                    8. Dip in 4% lye solution and drain. Sprinkle lightly with \
                    pretzel salt and score the pieces as appropriate.

                    9. Bake 18-22 minutes at 400-425 degrees. (I bake at 425.)
                    """
            )
        ],
        notes: """
            These would be best baked in an oven that injects steam during the \
            first phase of baking.  Since American ovens typically don't inject \
            steam, I spray the formed bread liberally with water prior to baking \
            and then immediately after I put them in the hot 425-degree oven, \
            I spray water liberally into the oven.

            In my convection oven, I bake two sheets at a time and 9 minutes \
            through the baking I swap and turn the sheets.  They usually finish \
            baking in a total of 18 minutes, sometimes a bit more.

            Spray the hot bread with water immediately after removing them from \
            the oven to give them a more glossy finish.

            They're the very best when they're hot from the oven.

            I typically use 85g for pretzels and stangen (sticks) now. Make \
            rolls slightly smaller, around 70g. For hamburger buns, use a bit \
            more dough, maybe 90-100g (and flatten them a bit when you put them \
            on the baking sheet). Hot dog buns are also nice. Just eye the \
            amount of dough you want for those. You'll find weights from \
            70-120g for various recipes on the web.

            **White Bread Variant:** You can make a standard white bread \
            variant of this recipe by using bread flour in place of the rye \
            flour and omitting the sourdough starter.  I really like both of \
            those ingredients, so I never make this variant anymore.

            This recipe is the result of trying many different pretzel recipes \
            and combining their best features.  The closest recipe to this is \
            an Austrian recipe by Christian Ofner.  See \
            <https://derbackprofi.at/rezept/laugenbrezen>.  Also watch his \
            YouTube video to see helpful tips on how to form the dough: \
            <https://www.youtube.com/watch?v=tVhf1w1GzrQ>.
            """
    ),
    Recipe(
        title: "Chocolate Chip Cookies",
        subtitle: "DoubleTree Signature Cookies",
        summary: """
            *There's nothing like a warm, home-made chocolate chip cookie!*
            """,
        course: "Dessert",
        cuisine: "American",
        difficultyLevel: "Simple",
        author: "",
        duration: "prep 10 min, chill 1-72 hours, bake 20 min",
        servings: "26 cookies",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 226, unit: "g", name: "butter", alternateQuantity: 1, alternateUnit: "cup", notes: "2 sticks"),
                    Ingredient(sequence: 2, quantity: 164, unit: "g", name: "granulated sugar", notes: "¾ C. + 1 Tbsp."),
                    Ingredient(sequence: 3, quantity: 150, unit: "g", name: "packed light brown sugar", alternateQuantity: 0.75, alternateUnit: "cup"),
                    Ingredient(sequence: 4, quantity: 2, unit: "", name: "large eggs"),
                    Ingredient(sequence: 5, quantity: 1.25, unit: "tsp", name: "vanilla extract"),
                    Ingredient(sequence: 6, quantity: 0.25, unit: "tsp", name: "freshly squeezed lemon juice"),
                    Ingredient(sequence: 7, quantity: 280, unit: "g", name: "flour", alternateQuantity: 2.25, alternateUnit: "cup"),
                    Ingredient(sequence: 8, quantity: 45, unit: "g", name: "rolled oats", alternateQuantity: 0.5, alternateUnit: "cup"),
                    Ingredient(sequence: 9, quantity: 1, unit: "tsp", name: "baking soda", alternateQuantity: 6, alternateUnit: "g"),
                    Ingredient(sequence: 10, quantity: 1, unit: "tsp", name: "salt", alternateQuantity: 6, alternateUnit: "g"),
                    Ingredient(sequence: 11, quantity: 0, unit: "pinch", name: "cinnamon"),
                    Ingredient(sequence: 12, quantity: 465, unit: "g", name: "semisweet chocolate chips",
                               alternateQuantity: 2.0 + 2.0 / 3, alternateUnit: "cup"),
                    Ingredient(sequence: 13, quantity: 220, unit: "g", name: "chopped walnuts",
                               alternateQuantity: 1.75, alternateUnit: "cup"),
                ]
            ),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Cream the butter, sugar, and brown sugar in a stand mixer \
                    on medium speed for about 2 minutes.

                    2. Add eggs, vanilla, and lemon juice, blending with mixer \
                    on low speed for 30 seconds, then medium speed for about 2 \
                    minutes or until light and fluffy, scraping down bowl as \
                    needed.

                    3. With mixer on low speed, add flour, oats, baking soda, \
                    salt, and cinnamon, blending for about 45 seconds.  Do not \
                    overmix.

                    4. Remove bowl from mixer and stir in chocolate chips and \
                    walnuts.

                    5. **Optional:** if you have time to wait, seal the dough \
                    and chill for 24-72 hours.

                    6. Portion dough with large scoop (about 3 Tbsp.) onto a \
                    baking sheet lined with parchment paper about 2 inches \
                    apart.

                    7. **Optional:** if you have time to wait, chill the dough \
                    for 30-60 minutes.

                    8. Preheat oven to 300°F.  Bake for 20-23 minutes, \
                    or until edges are golden brown and center is still soft. \
                    You can also bake at 325 or 350°F, reducing the \
                    baking time by 3-4 minutes for each additional 25 degrees. \
                    Baking with chilled dough takes more time.

                    9. Remove from oven and cool on baking sheet for about an \
                    hour.  (You can also cool on baking sheet for 5 minutes \
                    before transferring to a cooling rack.)
                    """
            )
        ],
        notes: """
            You can freeze the unbaked cookies and there's no need to thaw. \
            Preheat oven to 300°F and place frozen cookies on \
            parchment paper-lined baking sheet about 2 inches apart.  Bake \
            until edges are golden brown and center is still soft.
            """
    ),
    Recipe(
        title: "Brown Butter Chocolate Chip Cookies",
        subtitle: "",
        summary: """
            *The browned butter in this recipe adds a depth of flavor that is \
            sure to make it a crowd-pleaser.*
            """,
        course: "Dessert",
        cuisine: "American",
        difficultyLevel: "Simple",
        author: "Maria Dixon Lichty",
        duration: "prep 10 min, chill 1-72 hours, bake 20 min",
        servings: "26 cookies",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 226, unit: "g", name: "butter, cut into tablespoons", alternateQuantity: 1, alternateUnit: "cup", notes: "2 sticks"),
                    Ingredient(sequence: 2, quantity: 300, unit: "g", name: "all-purpose flour", alternateQuantity: 2.5, alternateUnit: "cup"),
                    Ingredient(sequence: 3, quantity: 1, unit: "tsp", name: "baking soda"),
                    Ingredient(sequence: 4, quantity: 1, unit: "tsp", name: "sea salt"),
                    Ingredient(sequence: 5, quantity: 225, unit: "g", name: "packed light brown sugar", alternateQuantity: 1.25, alternateUnit: "cup"),
                    Ingredient(sequence: 6, quantity: 99, unit: "g", name: "granulated sugar", alternateQuantity: 0.5, alternateUnit: "cup"),
                    Ingredient(sequence: 7, quantity: 1, unit: "", name: "large egg"),
                    Ingredient(sequence: 8, quantity: 2, unit: "", name: "egg yolks"),
                    Ingredient(sequence: 9, quantity: 1, unit: "Tbsp", name: "vanilla extract"),
                    Ingredient(sequence: 10, quantity: 212, unit: "g", name: "chocolate chunks or chips",
                               alternateQuantity: 1.25, alternateUnit: "cup", notes: "dark, semi-sweet, or milk chocolate"),
                    Ingredient(sequence: 11, quantity: 0, unit: "", name: "flaky sea salt",
                               notes: "for sprinkling on cookies"),
                ]
            ),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. Place butter in a light-colored medium saucepan and melt \
                    over medium heat, stirring often, until it foams, browns, \
                    and smells nutty (this will take about five to seven \
                    minutes). Scrape browned butter into a stand mixer bowl. \
                    Let cool to room temperature.

                    2. In a medium bowl, whisk together flour, baking soda, and \
                    salt.

                    3. In the stand mixer bowl combine browned butter, brown \
                    sugar, and granulated sugar. With beater blade, mix until \
                    well combined. Add egg, egg yolks, and vanilla. Mix until \
                    smooth. Add the dry ingredients. Mix on low until just \
                    combined. Don’t overmix. Stir in chocolate chunks. Wrap \
                    dough in plastic wrap and chill for at least two hours \
                    (but not more than 48 hours).

                    4. Preheat oven to 350 degrees. Line a large baking sheet \
                    with parchment paper. Scoop dough into 2 Tbsp. balls and \
                    place on baking sheet. Leave about 2 inches of space \
                    between each cookie. Bake 10–14 minutes or until cookies \
                    are set around the edges but still soft in the center. \
                    Remove from oven and sprinkle with flaky sea salt. Let \
                    cookies cool on baking sheet for five minutes.
                    """
            )
        ],
        notes: ""
    ),
    Recipe(
        title: "Dinkelbrötchen",
        subtitle: "Spelt Rolls",
        summary: """
            *These authentic German spelt rolls are iconic for those who know \
            Germany and Austria. They have sunflower seeds on the bottom and \
            a mix of poppy and sesame seeds on the top. They are absolutely \
            delicious and delightful!*
            """,
        course: "Bread",
        cuisine: "German, Austrian",
        difficultyLevel: "Advanced",
        author: "Häussler",
        duration: "",
        servings: "about 25 rolls",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 150, unit: "g", name: "whole spelt flour"),
                    Ingredient(sequence: 2, quantity: 50, unit: "g", name: "raw sunflower seeds"),
                    Ingredient(sequence: 3, quantity: 50, unit: "g", name: "flaxseed"),
                    Ingredient(sequence: 4, quantity: 50, unit: "g", name: "sesame seeds"),
                    Ingredient(sequence: 5, quantity: 300, unit: "ml", name: "water"),
                ],
                header: "Quellstück (Soaker)"
            ),
            RecipeSection(
                sequence: 2,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 850, unit: "g", name: "Dinkelmehl 630 (sieved spelt flour)"),
                    Ingredient(sequence: 2, quantity: 20, unit: "g", name: "salt"),
                    Ingredient(sequence: 3, quantity: 30, unit: "g", name: "barley malt powder"),
                    Ingredient(sequence: 4, quantity: 30, unit: "g", name: "butter"),
                    Ingredient(sequence: 5, quantity: 20, unit: "g", name: "yeast"),
                    Ingredient(sequence: 6, quantity: 600, unit: "g", name: "Quellstück"),
                    Ingredient(sequence: 7, quantity: 350, unit: "ml", name: "water"),
                    Ingredient(sequence: 8, quantity: 0, unit: "", name: "Poppy, sesame, and sunflower seeds"),
                ],
                header: "Teig (Final Dough)"
            ),
            RecipeSection(
                sequence: 3,
                header: "Instructions",
                text: """
                    1. Mix the ingredients for the Quellstück (soaker) and \
                    leave to soak for at least 5 hours.

                    2. Add the ingredients for the final dough to the \
                    Quellstück in a kneading machine and process for 8-10 \
                    minutes until a smooth dough is formed.

                    3. Cover the dough and let it rest for 30 minutes.

                    4. Cut into 70g pieces and shape them into round balls.

                    5. Moisten the rolls on both sides with a damp cloth, \
                    slightly flattening them, then roll the bottom side in \
                    sunflower seeds and the top side in a poppy/sesame \
                    mixture. Place the rolls on baking sheet lined with \
                    parchment paper.

                    6. Cover and let rest for about 1 hour.

                    7. Preheat oven to 450°F.

                    8. Before baking, spray generously with water.

                    9. Bake for 10 minutes at 450°F, then lower the \
                    temperature to 410° and bake for another 8-10 minutes.
                    """
            )
        ],
        notes: """
            While spelt flour is not very common in the United States, it is \
            quite common in Germany and Austria.  Spelt is an ancient form of \
            wheat that has a warmer, nuttier flavor.  To approximate the main \
            flour used in this recipe, Dinkelmehl 630, I sift freshly ground \
            whole spelt through a fine sieve to remove a portion of the germ. \
            It's a little messy, but I've  found that using a large extra-fine \
            sieve and sifting into a large metal bowl does a decent job.

            I like to get my raw sunflower seeds from Trader Joe's.  They sell \
            a variety that is large and beautiful.

            To moisten the rolls to attach the seeds, fold a tea towel and \
            place it in a small square or rectangular container.  Fill with \
            water to a sufficient level.  The water will be below the top of \
            the towel, but there will be enough to keep the towel well \
            moistened.  I find that I need to periodically stir the \
            poppy/sesame seed mix to keep a more even distribution, since the \
            seeds have different densities.  Haüssler has a video you can \
            watch to observe the preparation techniques.

            My favorite way to eat these rolls is to fill them with \
            scrambled egg, adding a slice of Swiss cheese and some good, \
            strong mustard. Mmmm, ist Die gut!  For me, an ideal breakfast.

            <https://www.backdorf.de/Rezepte/Kleingebaeck/Dinkelbroetchen.html>
            """
    ),
    Recipe(
        title: "Lebkuchenherzen",
        subtitle: "Gingerbread Hearts",
        summary: "*An Oktoberfest and Christmas Market icon, sure to be loved by all!*",
        course: "Dessert",
        cuisine: "German",
        difficultyLevel: "Intermediate",
        author: "",
        duration: "",
        servings: "8 hearts",
        calories: "728 kcal",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 300, unit: "g", name: "honey"),
                    Ingredient(sequence: 2, quantity: 150, unit: "g", name: "sugar", notes: "can use brown sugar"),
                    Ingredient(sequence: 3, quantity: 113, unit: "g", name: "butter", alternateQuantity: 0.5, alternateUnit: "cup", notes: "1 stick"),
                    Ingredient(sequence: 4, quantity: 500, unit: "g", name: "flour"),
                    Ingredient(sequence: 5, quantity: 2, unit: "Tbsp", name: "cocoa powder"),
                    Ingredient(sequence: 6, quantity: 15, unit: "g", name: "baking powder", alternateQuantity: 3.25, alternateUnit: "tsp"),
                    Ingredient(sequence: 7, quantity: 1, unit: "Tbsp", name: "Lebkuchengewürz"),
                    Ingredient(sequence: 8, quantity: 1, unit: "pinch", name: "salt"),
                    Ingredient(sequence: 9, quantity: 2, unit: "", name: "egg yolks"),
                    Ingredient(sequence: 10, quantity: 0, unit: "", name: "some lemon zest"),
                ]
            ),
            RecipeSection(
                sequence: 2,
                header: "Instructions",
                text: """
                    1. In a saucepan, heat the butter, honey, and sugar until the \
                    sugar completely dissolves (do not boil). Remove from the heat \
                    and allow the wet team to cool.
                    2. In a large bowl mix the flour, cocoa powder, baking powder, \
                    Lebkuchengewürz, salt, and lemon zest. Mix the egg yolks into the \
                    wet team, and then add the wet team to the dry team. Knead into a \
                    smooth dough. If you have time, cover and refrigerate for two hours.
                    3. Preheat the oven to 350 F (180 C). Line a baking sheet with parchment.
                    4. Roll out the dough to about ¼ inch thickness. Using a large \
                    heart-shaped cookie cutter or a homemade template, cut hearts out of \
                    the dough and place on baking sheet, leaving room for them to rise.
                    5. Bake the gingerbread hearts for 11-12 minutes. Remove from oven \
                    and place on cooling rack.
                    6. Use a small round object (like a large round decorating tip) to \
                    cut out two holes for string or ribbon to hang the finished hearts.
                    7.  Let cool completely before decorating.
                    """
            ),
            RecipeSection(
                sequence: 3,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 500, unit: "g", name: "powdered sugar"),
                    Ingredient(sequence: 2, quantity: 2, unit: "", name: "egg whites"),
                    Ingredient(sequence: 3, quantity: 1, unit: "pinch", name: "salt"),
                    Ingredient(sequence: 4, quantity: 2, unit: "Tbsp", name: "lemon juice"),
                    Ingredient(sequence: 5, quantity: 0, unit: "", name: "food coloring of your choice"),
                ],
                header: "For the Icing",
                text: """
                    1. Whisk the egg whites and a pinch of salt to soft peaks.
                    2. Gradually add the powdered sugar and lemon juice.  The icing \
                    should stick to the whisk but still be soft enough to be piped.
                    4. Divide the icing into small portions. Add the food coloring as \
                    desired. If the food coloring is too runny, add more powdered sugar. \
                    consistency. Keep some white icing for writing.
                    5. Fill into piping bags with appropriate tips and decorate.

                    **Decorating Tips**
                    1. One tip is to test your designs on some baking parchment before \
                    decorating the hearts. You can always scoop up the icing with a \
                    spoon and place it back into the piping bag for later.
                    2. Start with the writing then continue to the outside.
                    3. Test your piping on baking parchment before applying it to the \
                    cookie.
                    4. If you are unsure of the spacing, trace the letters lightly with \
                    a skewer and then pipe the icing.
                    5. If icing loses shape after you pipe it, add more sugar.
                    6. If icing is too hard and dry, add a little lemon juice.
                    7. Prepare ornamental decorations. You can make little flowers, \
                    hearts or stars by piping them on some baking parchment. Once they \
                    are dry you can stick them on with a little icing. This is easier \
                    than doing it directly on the hearts.

                    **Gift Wrap the Gingerbread Hearts**
                    
                    Wrap the Lebkuchenherzen in some clingfilm. Make two holes for \
                    where the string goes through. Now thread through the string and \
                    it is ready to give away.

                    **Storage Instructions**

                    These gingerbread hearts are sometimes too pretty to eat. But how \
                    long do these pretty heart-shaped cakes last? Do not worry. A \
                    Lebkuchenherz lasts up to two years. If it gets too hard to eat, \
                    simply place it in the fridge for a while, and it will soften. Or \
                    place it in an airtight container with some apples to soften it.
                    """
            )
        ],
        notes: """
            See <https://mygerman.recipes/oktoberfest-gingerbread-hearts-lebkuchenherzen/>, \
            <https://germanfoods.org/recipes/traditional-gingerbread-hearts/>, \
            and <https://mydinner.co.uk/lebkuchenherzen-recipe/>.
            """
    ),
    Recipe(
        title: "Frisian Black Bread",
        subtitle: "Fries Swartbrood",
        summary: "*A very simple bread that is enormously tasty.*",
        course: "Bread",
        cuisine: "Holland",
        difficultyLevel: "Intermediate",
        author: "Stanley Ginsberg",
        duration: "18-22 hours",
        servings: "One 2 ¾ lb. (1.2 kg) loaf",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 167, unit: "g", name: "fine rye meal or medium rye flour", bakersPercent: 100),
                    Ingredient(sequence: 2, quantity: 333, unit: "g", name: "water", bakersPercent: 200),
                    Ingredient(sequence: 3, quantity: 20, unit: "g", name: "rye sour culture", bakersPercent: 12)
                ],
                header: "Stage 1 Sponge (Day 1, Evening)",
                text: """
                    1. Mix the Stage 1 sponge ingredients by hand until incorporated, \
                    cover, and ferment at room temperature (68-72°F/20-22°C) overnight, \
                    10-12 hours.  The sponge will be very bubbly, have a clean sour \
                    smell, and will have doubled in volume.
                    """
            ),
            RecipeSection(
                sequence: 2,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 167, unit: "g", name: "fine rye meal or medium rye flour", bakersPercent: 50),
                    Ingredient(sequence: 2, quantity: 167, unit: "g", name: "bread flour", bakersPercent: 50),
                    Ingredient(sequence: 3, quantity: 250, unit: "g", name: "water", bakersPercent: 75),
                    Ingredient(sequence: 4, quantity: 520, unit: "g", name: "stage 1 sponge", bakersPercent: 156)
                ],
                header: "Stage 2 Sponge (Day 2, Morning)",
                text: """
                    2. Add the rye meal, bread flour, and water to the sponge, mix by \
                    hand to incorporate, cover, and ferment at room temperature until \
                    bubbly and well expanded, 6-8 hours.
                    """
            ),
            RecipeSection(
                sequence: 3,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 1104, unit: "g", name: "stage 2 sponge"),
                    Ingredient(sequence: 2, quantity: 167, unit: "g", name: "bread flour"),
                    Ingredient(sequence: 3, quantity: 12, unit: "g", name: "salt"),
                    Ingredient(sequence: 4, quantity: 28, unit: "g", name: "honey"),
                    Ingredient(sequence: 5, qualifier: "As needed", quantity: 0, unit: "", name: "vegetable shortening for pan")
                ],
                header: "Final Dough (Day 2, Afternoon)",
                text: """
                    3. Combine the sponge, flour, salt, and honey in the mixer and use \
                    the paddle at low (KA2) speed to mix until the dough is thick but \
                    still fluid, like a heavy batter, 6-8 minutes.  Cover and ferment \
                    at room temperature until the surface of the dough shows bubbles, \
                    30-45 minutes.

                    4. Pour the dough into a well-greased 9-by-4-by-4-inch/23-by-10-by-10 \
                    cm Pullman loaf pan or standard 9-by-5-inch/23-by-13 cm loaf pan, \
                    put it into a cold oven, and proof until the dough approaches the \
                    rim of the pan, 30-45 minutes.

                    5. Heat the oven to 460°F/240°C with the baking surface in the \
                    middle.  Once the oven has reached temperature, bake for 20 minutes, \
                    then lower the temperature 375°F/190°C and continue baking until the \
                    loaf thumps when tapped with a finger and the internal temperature \
                    is at least 198°F/92°C, 75-80 minutes.  Remove from the pan and \
                    transfer to a rack.  Let stand at least 24 hours before slicing.
                    """
            ),
        ],
        notes: """
            From *The Rye Baker*, by Stanley Ginsberg.  Thanks to my good friend
            Lara Burton, who gifted me the book and nurtured my interest in rye
            bread baking.  This is a lighter bread that Melody and I enjoy quite
            a bit.
            """
    ),
    Recipe(
        title: "Hearty Seeded Rye",
        subtitle: "Saftig Kerniges Roggenbrot",
        summary: "*This recipe from Lower Saxony pulls out all the stops.*",
        course: "Bread",
        cuisine: "Germany",
        difficultyLevel: "Advanced",
        author: "Stanley Ginsberg",
        duration: "20-24 hours",
        servings: "One 4 lb. (1.8 kg) loaf",
        calories: "",
        sections: [
            RecipeSection(
                sequence: 1,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 250, unit: "g", name: "medium rye flour", bakersPercent: 100),
                    Ingredient(sequence: 2, quantity: 205, unit: "g", name: "warm water (105°F/41°C)", bakersPercent: 82),
                    Ingredient(sequence: 3, quantity: 5, unit: "g", name: "salt", bakersPercent: 2),
                    Ingredient(sequence: 4, quantity: 25, unit: "g", name: "rye sour culture", bakersPercent: 10)
                ],
                header: "Sponge (Day 1, Afternoon)",
                text: """
                    1. Mix the sponge ingredients by hand until incorporated, \
                    cover, and ferment at room temperature (68-72°F/20-22°C) for \
                    16-18 hours.  The sponge will have a clean sour smell and will have \
                    begun to collapse back on itself.
                    """
            ),
            RecipeSection(
                sequence: 2,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 240, unit: "g", name: "coarse rye meal", bakersPercent: 100),
                    Ingredient(sequence: 2, quantity: 192, unit: "g", name: "boiling water", bakersPercent: 80),
                    Ingredient(sequence: 3, quantity: 18, unit: "g", name: "salt", bakersPercent: 7),
                ],
                header: "Scald (Day 1, Afternoon)",
                text: """
                    2. Combine the scald ingredients, cover, and let stand at room \
                    temperature for 16-18 hours.
                    """
            ),
            RecipeSection(
                sequence: 3,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 160, unit: "g", name: "sunflower seeds", bakersPercent: 100),
                    Ingredient(sequence: 2, quantity: 320, unit: "g", name: "warm water (105°F/41°C)", bakersPercent: 200),
                    Ingredient(sequence: 3, quantity: 80, unit: "g", name: "flaxseed", bakersPercent: 50),
                    Ingredient(sequence: 4, quantity: 80, unit: "g", name: "stale rye bread, crumbled", bakersPercent: 50)
                ],
                header: "Soaker (Day 1, Afternoon)",
                text: """
                    3. In a separate bowl, combine the soaker ingredients, stir to \
                    blend, cover, and let stand for 16-18 hours.
                    """
            ),
            RecipeSection(
                sequence: 4,
                ingredients: [
                    Ingredient(sequence: 1, quantity: 485, unit: "g", name: "sponge"),
                    Ingredient(sequence: 2, quantity: 450, unit: "g", name: "scald"),
                    Ingredient(sequence: 3, quantity: 640, unit: "g", name: "soaker"),
                    Ingredient(sequence: 4, quantity: 250, unit: "g", name: "coarse rye meal"),
                    Ingredient(sequence: 5, quantity: 70, unit: "g", name: "medium rye flour"),
                    Ingredient(sequence: 6, quantity: 128, unit: "g", name: "warm water (105°F/41°C)"),
                    Ingredient(sequence: 7, quantity: 2, unit: "g", name: "instant yeast"),
                    Ingredient(sequence: 8, quantity: 40, unit: "g", name: "malt syrup, light molasses, honey, or beet syrup"),
                    Ingredient(sequence: 9, qualifier: "As needed", quantity: 0, unit: "", name: "vegetable shortening for pan"),
                    Ingredient(sequence: 10, qualifier: "As needed", quantity: 0, unit: "", name: "sunflower seeds for topping"),
                ],
                header: "Final Dough (Day 2, Morning)",
                text: """
                    4. Combine the sponge, scald, and soaker with the rye meal and flour,
                    warm water, yeast, and syrup in the mixer and use the paddle at low
                    (KA2) speed to mix until the dough comes together in a dense, sticky
                    mass and the rye meal kernels have broken up, 30-35 minutes.  Cover
                    and ferment at room temperature until visibly expanded, 45-60 minutes.

                    5. Return the dough to the mixer and use the dough hook at low (KA2)
                    speed, scraping down the bowl as necessary, until the dough is back
                    to its original volume, 5-6 minutes.  Then use a plastic dough scraper
                    and wet hands to transfer it into a well-greased 9-by-4-by-4-inch/23-by-10-by-10 cm
                    Pullman loaf pan or 9-by-5-inch/23-by-13-by-8 cm loaf pan.  Smooth
                    the top with wet hands, then cover and proof at room temperature
                    until the dough has risen about 1 inch/2.5 cm, 30-40 minutes.

                    6. Preheat the oven to 465°F/240°C with a steam pan and the baking
                    surface in the middle.  Use a docking wheel, chopstick, or skewer to
                    dock the loaf thoroughly to a depth of at least ½ inch/1.25 cm,
                    brush with water, and sprinkle liberally with sunflower seed.  Bake
                    with steam for 5 minutes, then remove the steam pan.  Bake for 15
                    minutes more at 465°F/240°C, then lower the temperature to 390°F/200°C
                    and bake until the loaf thumps when tapped with a finger and the
                    internal temperature is at least 198°F/92°C, about 90 minutes.
                    Transfer to a rack and let stand for 24-48 hours before slicing.
                    """
            ),
        ],
        notes: """
            From *The Rye Baker*, by Stanley Ginsberg.  Thanks to my good friend
            Lara Burton, who gifted me the book and nurtured my interest in rye
            bread baking.  This is our favorite rye bread.  It's rich, complex,
            and an absolute delight.  I love it toasted, with butter and honey
            or topped with egg.

            Lara gave me a great tip.  Trader Joe's sells an excellent raw sunflower
            seed package that has large, beautiful seeds.  This has become my go-to
            source for sunflower seeds.
            """
    )
]
