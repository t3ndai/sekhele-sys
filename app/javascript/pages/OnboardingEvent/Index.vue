<template>
  <Head title="Onboarding events" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Onboarding events</h1>

  <div>
    <div v-for="onboarding_event in onboarding_events" :key="onboarding_event.id">
      <OnboardingEvent :onboarding_event="onboarding_event" />
      <p>
        <Link :href="`/onboarding_events/${onboarding_event.id}`">Show this onboarding event</Link>
      </p>
    </div>
  </div>

  <Link href="/onboarding_events/new">New onboarding event</Link>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import OnboardingEvent from './OnboardingEvent.vue'

const { onboarding_events, flash } = defineProps(['onboarding_events', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
