<template>
  <div>
    <p>
      <strong>Name:</strong>
      {{ onboard_task.name }}
    </p>
    <p>
      <strong>Assignee:</strong>
      {{ onboard_task.assignee_id }}
    </p>
    <p>
      <strong>Tags:</strong>
      {{ onboard_task.tags }}
    </p>
    <p>
      <strong>Due on:</strong>
      {{ onboard_task.due_on }}
    </p>
  </div>
</template>

<script setup>
const { onboard_task } = defineProps(['onboard_task'])
</script>
