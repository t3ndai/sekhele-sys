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


</template>

<script setup>
import NewMotivation from './NewMotivation.vue';
import Motivation from '../../components/Motivation.vue';
import Talents from '../../components/Talents.vue';
import NewTalent from './NewTalent.vue';

defineProps({
  motivations: Array,
  talents: Array,
})

</script>