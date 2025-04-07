<template>
  <div>
    <h3 class="heading belgrano-regular">Motivations</h3>
    <NewMotivation />
    <Motivation :motivations="motivations" />
  </div>

  <div>
    <h3 class="heading belgrano-regular">Talents / Skills</h3>
    <NewTalent />
    <Talents :talents="talents" />
  </div>

  <div>
    <h3 class="heading belgrano-regular">Growth Areas</h3>
    <NewGrowthArea />
    <GrowthArea :growth_areas="growth_areas" />
  </div>


</template>

<script setup>
import NewMotivation from './NewMotivation.vue';
import Motivation from '../../components/Motivation.vue';
import Talents from '../../components/Talents.vue';
import NewTalent from './NewTalent.vue';
import NewGrowthArea from './NewGrowthArea.vue';
import GrowthArea from '../../components/GrowthArea.vue';

defineProps({
  motivations: Array,
  talents: Array,
  growth_areas: Array,
})

</script>