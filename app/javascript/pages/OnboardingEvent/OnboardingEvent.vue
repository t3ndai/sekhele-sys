<template>
  <div>
    <p>
      <strong>New joiner:</strong>
      {{ onboarding_event.new_joiner_id }}
    </p>
    <p>
      <strong>Contact:</strong>
      {{ onboarding_event.contact_id }}
    </p>
    <p>
      <strong>Manager:</strong>
      {{ onboarding_event.manager_id }}
    </p>
    <p>
      <strong>On:</strong>
      {{ onboarding_event.on }}
    </p>
    <p>
      <strong>At:</strong>
      {{ onboarding_event.at }}
    </p>
    <p>
      <strong>Instructions:</strong>
      {{ onboarding_event.instructions }}
    </p>
  </div>
</template>

<script setup>
const { onboarding_event } = defineProps(['onboarding_event'])
</script>
