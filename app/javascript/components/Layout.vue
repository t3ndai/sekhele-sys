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
        <div class="flex items-center">
            <Link :href="`/employees/${employee.id}/benefits`">
            <span class="material-symbols-outlined">
                shopping_basket
            </span>
            <div>Benefits</div>
            </Link>
        </div>
        <div>
            <Link href="">
            <span class="material-symbols-outlined">
                communication
            </span>
            <span>1-1s </span>
            </Link>
        </div>
    </header>
    <main>
        <slot></slot>
    </main>
</template>