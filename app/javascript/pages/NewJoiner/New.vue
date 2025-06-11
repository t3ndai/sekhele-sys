<template>

  <Head title="New new joiner" />

  <h1 class="font-belgrano">Onboard {{ name }}</h1>

  <Form :new_joiner="new_joiner" :managers submitText="Create New joiner" @onSubmit="handleSubmit" />

  <br />

  <div>
    <Link href="/new_joiners">Back to new joiners</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { new_joiner, managers, name } = defineProps(['new_joiner', 'managers', 'name'])

const handleSubmit = (form) => {
  form.transform((data) => ({ new_joiner: data }))
  form.post('/new_joiners')
}
</script>
