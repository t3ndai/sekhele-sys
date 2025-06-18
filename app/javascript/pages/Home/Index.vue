<template>

    <Head>
        <title>Werk by Sekhele</title>
        <meta name="description"
            content="Werk by Sekhele is a platform to support HR & Finance Operations in the SADC Market i.e Zimbabwe, South Africa, Zambia, Mozambique, Malawi, Botswana, Namibia, Lesotho, Swaziland, Eswatini, and other countries in the region" />
    </Head>

    <div class="flex justify-end">
        <!--<SignIn />-->
        <Button as="a" class="signIn-btn" href="/sign_in" v-if="!employee">
            Sign In
        </Button>
    </div>

    <div class="flex flex-col gap-y-10 mt-48 mb-48">
        <p class="font-belgrano header text-9xl">Werk by Sekhele</p>
        <p class="text-center text-3xl font-jura text-gray-600 font-medium">
            Werk is your Organization's Bespoke Operating System to run your HR,
            Finance & Entire Operations*
        </p>
        <p class="text-center text-2xl font-jura text-gray-600 font-medium">
            We start with your most crucial asset which is your employees. Your
            employees are your engine, we are the oil that keeps your engine
            running smoothly.
        </p>
    </div>

    <div class="flex gap-x-4 space-y-48">
        <div class="basis-1/3">
            <img :src="target" class="rounded-lg aspect-square h-96 w-96" />
        </div>
        <div class="basis-2/3 self-baseline">
            <p class="font-belgrano text-center text-4xl minor-header">
                Strategic Alignment
            </p>
            <p class="text-center text-2xl font-jura text-gray-600 font-medium">
                Align your employees with your company's goals through tools
                such as Tasks, Employee Goals,Milestones with deadlines. <br />
                Streamline HR & Finance Operations by having a centralized
                platform for all HR and Finance related tasks. Automate
                repetitive tasks and reduce manual errors.
            </p>
            <p class="text-center text-2xl font-jura text-sky-500 font-medium">
                Big Picture Thinking. Big Results.
            </p>
        </div>
    </div>

    <div class="flex gap-x-4 space-y-48 items-center">
        <div class="basis-1/3">
            <img :src="packages" class="rounded-lg h-96 w-96 aspect-square @sm:aspect-3/2" />
        </div>
        <div class="basis-2/3 self-baseline">
            <p class="font-belgrano text-center text-4xl minor-header">
                Incentives & Compensation (Payroll)
            </p>
            <p class="font-jura text-center text-2xl text-gray-600 font-medium">
                Incentivize your employees to achieve your company's goals
                through Compensation (Payroll) - Job Levels, Compensation Bands,
                Benefits Management, Leave Management & Booking and Recognition
                tools.
            </p>
        </div>
    </div>

    <div class="flex space-y-48 items-center">
        <div class="basis-1/3">
            <img :src="seedling" class="rounded-lg h-96 w-96 aspect-square @sm:aspect-3/2" />
        </div>

        <div class="basis-2/3 self-baseline">
            <p class="font-belgrano text-center text-4xl minor-header">
                Growth
            </p>
            <p class="font-jura text-center text-2xl text-gray-600 font-medium">
                Grow your company through your employees by empowering your
                employees Career Growth & development through tools such as
                1-1s, Career Development Plans, and Performance Reviews
            </p>
        </div>
    </div>

    <div class="flex gap-x-4 space-y-48 items-center">
        <div class="basis-1/3">
            <img :src="magnet" class="rounded-lg h-96 w-96 aspect-square @sm:aspect-3/2" />
        </div>

        <div class="basis-2/3 self-baseline">
            <p class="font-belgrano text-center text-4xl minor-header">
                Attract
            </p>
            <p class="font-jura text-center text-2xl text-gray-600 font-medium">
                Attract Talent through tools such as Online Job Posts, Online Job
                applications. <br />
                Offer a better Candidate experience and Recruitment tools such
                as Interview Scheduling, Interview stages, Candidate notes &
                Interview Feedback. <br />
                Which enables efficient tracking of candidates through your
                pipeline so you can hire the right people for the right roles at
                the right time.
            </p>
        </div>
    </div>

    <div class="flex gap-x-4 space-y-48 items-center">
        <div class="basis-1/3">
            <img :src="chain" class="rounded-lg h-96 w-96 aspect-square @sm:aspect-3/2" />
        </div>
        <div class="basis-2/3 self-baseline">
            <p class="font-belgrano text-center text-4xl minor-header">
                Connect & Engage
            </p>
            <p class="font-jura text-center text-2xl text-gray-600 font-medium">
                Keep your employees Happy and Engaged through tools such as
                Employee (Anonymous) Feedback, Pulse Surveys, and Employee
                Recognition & Company Posts and Communities.
            </p>
        </div>
    </div>
</template>

<script setup>
import { Head, usePage } from "@inertiajs/vue3";
import { Button } from "primevue";
import { computed } from "vue";
import SignIn from "./SignIn.vue";
import packages from "~/assets/images/packages.jpg";
import seedling from "~/assets/images/seedling.jpg";
import target from "~/assets/images/target.jpg";
import magnet from "~/assets/images/magnet.jpg";
import chain from "~/assets/images/chain.jpg";

const page = usePage();
const employee = computed(() => page.props.employee);
</script>

<style scoped>
.header {
    color: var(--color-rose-800);
    text-align: center;
}

.minor-header {
    color: var(--color-rose-600);
}

.signIn-btn {
    border: none;
    background-color: var(--color-indigo-500);
}
</style>
