<template>
  <Head :title="`Onboard task #${onboard_task.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Onboard task #{{ onboard_task.id }}</h1>

  <OnboardTask :onboard_task="onboard_task" />

  <div>
    <Link :href="`/onboard_tasks/${onboard_task.id}/edit`">Edit this onboard task</Link> |
    <Link href="/onboard_tasks">Back to onboard tasks</Link>

    <br />

    <Link
      :href="`/onboard_tasks/${onboard_task.id}`"
      as="button"
      method="delete"
    >
      Destroy this onboard task
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import OnboardTask from './OnboardTask.vue'

const { onboard_task, flash } = defineProps(['onboard_task', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
