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
                <Link :href="`/employees/${employee.id}/people`" class="flex justify-center items-baseline"
                    :class="{ 'text-orange-500': $page.component === 'People/Index' }" as="button">
                DIRECTORY
                </Link>
            </div>
            <div>
                <Link :href="`/employees/${employee.id}/my_stuff`" class="flex justify-center items-baseline"
                    as="button" :class="{ 'text-orange-500': $page.component === 'MyStuff/Index' }">
                MY STUFF
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
                <Link :href="`/employees/${employee.id}/recruitment`" class="flex justify-center items-baseline"
                    as="button" :class="{ 'text-orange-500': $page.component === 'Recruitment/Index' }">
                RECRUITMENT
                </Link>
            </div>
            <div>
                <Link :href="`/employees/${employee.id}/leave`" class="flex justify-center items-baseline" as="button"
                    :class="{ 'text-orange-500': $page.component === 'Leave/Index' }">
                LEAVE
                </Link>
            </div>

            <div>
                <Link :href="`/employees/${employee.id}/my_career`" class="flex justify-center items-baseline"
                    as="button" :class="{ 'text-orange-500': $page.component === 'MyCareer/Index' }">
                MY CAREER
                </Link>
            </div>

            <div v-if="employee.is_manager">
                <Link :href="`/employees/${employee.id}/reports`" class="flex justify-center items-baseline" as="button"
                    :class="{ 'text-orange-500': $page.component === 'Reports/Index' }">
                REPORTS
                </Link>
            </div>
        </nav>
        <main>
            <slot></slot>
        </main>
    </div>
</template>

<style scoped>
nav {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 7rem;
    padding-left: 0.5rem;
    font-size: 0.875rem;
    background-color: ivory;

}

main {
    flex: 1;
    padding: 1rem;
}
</style>