<template>
  <Head title="Onboard tasks" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Onboard tasks</h1>

  <div>
    <div v-for="onboard_task in onboard_tasks" :key="onboard_task.id">
      <OnboardTask :onboard_task="onboard_task" />
      <p>
        <Link :href="`/onboard_tasks/${onboard_task.id}`">Show this onboard task</Link>
      </p>
    </div>
  </div>

  <Link href="/onboard_tasks/new">New onboard task</Link>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import OnboardTask from './OnboardTask.vue'

const { onboard_tasks, flash } = defineProps(['onboard_tasks', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
