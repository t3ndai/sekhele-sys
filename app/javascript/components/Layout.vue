<script setup>
import Menu from 'primevue/menu';
import { Link } from '@inertiajs/vue3'
import { usePage } from '@inertiajs/vue3'
import { computed, ref } from 'vue'

const page = usePage()
const employee = computed(() => page.props.employee)
</script>

<template>
    <div class="flex gap-x-4">

        <nav class="flex flex-col insert-y-0 left-0 gap-y-4 items-center bg-gray-100 w-20 min-h-screen">
            <div>
                <Link :href="`/employees/${employee.id}/home`" class="mt-4 flex items-baseline justify-center"
                    :class="{ 'text-orange-500': $page.component === 'EmployeeDashboard/Show' }" as="button">
                HOME
                </Link>
            </div>
            <div>
                <Link :href="`/employees/${employee.id}/benefits`"
                    class="flex justify-center items-center align-text-bottom"
                    :class="{ 'text-orange-500': $page.component === 'EmployeeBenefits/Index' }" as="button">
                BENEFITS
                </Link>
            </div>
            <div>
                <Link :href="`/employees/${employee.id}/one_to_ones`" class="flex justify-center items-baseline"
                    :class="{ 'text-orange-500': $page.component === 'OneToOnes/Index' }" as="button">
                1-1s
                </Link>
            </div>
            <div>
                <Link href="" class="flex justify-center items-baseline" as="button">
                ASSETS
                </Link>
            </div>
            <div>
                <Link href="" class="flex justify-center items-baseline" as="button">
                PAY
                </Link>
            </div>
            <div>
                <Link href="" class="flex justify-center items-baseline" as="button">
                LEAVE
                </Link>
            </div>
            <div>
                <Link href="" class="flex justify-center items-baseline" as="button">
                MY DOCUMENTS
                </Link>
            </div>
            <div>
                <Link href="" class="flex justify-center items-baseline" as="button">
                MY CAREER
                </Link>
            </div>
        </nav>
        <main>
            <slot></slot>
        </main>
    </div>
</template>