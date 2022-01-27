import { Antagonist, Category } from "../base";
import { multiline } from "common/string";

export const BHUNTER_MECHANICAL_DESCRIPTION = multiline`
  You start with objectives, though you're free to embark on objectives of
  your own, as long as there is currency to be gained.
`;

const BHunter: Antagonist = {
  key: "bounty hunter",
  name: "Bounty Hunter",
  description: [
    multiline`
    Through shed blood of others over the years, You've become the killer
    you are today. Accept contracts for the highest bidder, complete any
    and all objectives given to you as long as the employer pays.
  `,

    BHUNTER_MECHANICAL_DESCRIPTION,
  ],
  category: Category.MojaveSun,
};

export default BHunter;
