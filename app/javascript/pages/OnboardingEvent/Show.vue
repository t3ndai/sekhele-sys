<template>
  <Head :title="`Onboarding event #${onboarding_event.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Onboarding event #{{ onboarding_event.id }}</h1>

  <OnboardingEvent :onboarding_event="onboarding_event" />

  <div>
    <Link :href="`/onboarding_events/${onboarding_event.id}/edit`">Edit this onboarding event</Link> |
    <Link href="/onboarding_events">Back to onboarding events</Link>

    <br />

    <Link
      :href="`/onboarding_events/${onboarding_event.id}`"
      as="button"
      method="delete"
    >
      Destroy this onboarding event
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import OnboardingEvent from './OnboardingEvent.vue'

const { onboarding_event, flash } = defineProps(['onboarding_event', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
