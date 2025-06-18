<template>
  <div>
    <p>
      <strong>New joiner:</strong>
      {{ onboard_checklist.new_joiner_id }}
    </p>
    <p>
      <strong>Name:</strong>
      {{ onboard_checklist.name }}
    </p>
  </div>
</template>

<script setup>
const { onboard_checklist } = defineProps(['onboard_checklist'])
</script>
