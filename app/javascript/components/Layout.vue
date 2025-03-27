<script setup>
import { Link } from '@inertiajs/vue3'
import { usePage } from '@inertiajs/vue3'
import { computed } from 'vue'

const page = usePage()
const employee = computed(() => page.props.employee)
</script>

<template>
    <header class="flex justify-between items-center p-4 bg-gray-100">
        <div>
            <Link :href="`/employees/${employee.id}/home`" class="flex items-baseline">
            <i class="pi pi-home"></i>
            Home
            </Link>
        </div>
        <div>
            <Link :href="`/employees/${employee.id}/benefits`" class="flex items-baseline">
            <span class="material-symbols-outlined">
                shopping_basket
            </span>
            Benefits
            </Link>
        </div>
        <div>
            <Link href="">
            <span class="material-symbols-outlined">
                communication
            </span>
            1-1s
            </Link>
        </div>
    </header>
    <main>
        <slot></slot>
    </main>
</template>