<template>
  <div>
    <div class="subsection">
      <h3 class="heading belgrano-regular">Motivations</h3>
      <div>
        <NewMotivation />
      </div>
    </div>
    <Motivation :motivations="motivations" />
  </div>

  <div>
    <div class="subsection">
      <h3 class="heading belgrano-regular title">Talents / Skills</h3>
      <div class="new-item">
        <NewTalent />
      </div>

    </div>
    <Talents :talents="talents" />
  </div>

  <div>
    <div class="subsection">
      <h3 class="heading belgrano-regular">Growth Areas</h3>
      <div>
        <NewGrowthArea />
      </div>
    </div>
    <GrowthArea :growth_areas="growth_areas" />
  </div>

  <div>
    <div class="subsection">
      <h3 class="heading belgrano-regular">Career Vision</h3>
      <div>
        <NewCareerVision :outlines="career_outlines" />
      </div>
    </div>
    <CareerVision :career_visions="career_visions" />
  </div>


</template>


<script setup>
import NewMotivation from './NewMotivation.vue';
import Motivation from '../../components/Motivation.vue';
import Talents from '../../components/Talents.vue';
import NewTalent from './NewTalent.vue';
import NewGrowthArea from './NewGrowthArea.vue';
import GrowthArea from '../../components/GrowthArea.vue';
import NewCareerVision from './NewCareerVision.vue';
import CareerVision from '../../components/CareerVision.vue';

defineProps({
  motivations: Array,
  talents: Array,
  growth_areas: Array,
  career_outlines: Array,
  career_visions: Array,
})

</script>

<style scoped>
.subsection {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  padding: 12px;

}
</style>