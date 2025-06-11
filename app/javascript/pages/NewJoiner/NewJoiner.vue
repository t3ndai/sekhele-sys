<template>
  <div>
    <p>
      <strong>Start date:</strong>
      {{ new_joiner.start_date }}
    </p>
    <p>
      <strong>Manager:</strong>
      {{ new_joiner.manager_id }}
    </p>
    <p>
      <strong>Job applicant:</strong>
      {{ new_joiner.job_applicant_id }}
    </p>
  </div>
</template>

<script setup>
const { new_joiner } = defineProps(['new_joiner'])
</script>
